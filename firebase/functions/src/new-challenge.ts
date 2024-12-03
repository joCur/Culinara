import * as functions from "firebase-functions";
import { defineSecret } from "firebase-functions/params";
import OpenAI from "openai";
import * as admin from "firebase-admin";
import * as logger from "firebase-functions/logger";

// Initialize admin if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

export const generateChallenge = functions.https.onRequest(async (req, res) => {
  try {
    // Verify authentication
    const authHeader = req.headers.authorization;
    console.log(authHeader);
    if (!authHeader || !authHeader.startsWith("Bearer ")) {
      res.status(401).json({ error: "Unauthorized - Missing or invalid authentication token" });
      return;
    }

    const idToken = authHeader.split("Bearer ")[1];
    try {
      await admin.auth().verifyIdToken(idToken);
    } catch (authError) {
      logger.error(authError);
      res.status(401).json({ error: "Unauthorized - Invalid authentication token" });
      return;
    }

    const { preferences, numIngredients } = req.body;

    if (!preferences || !numIngredients) {
      res.status(400).json({ error: "Missing required parameters" });
      return;
    }

    const apiKey = defineSecret("OPENAI_API_KEY").value();
    const openai = new OpenAI({
      apiKey: apiKey,
    });

    // Create a new thread
    const thread = await openai.beta.threads.create();

    // Add a message to the thread
    await openai.beta.threads.messages.create(thread.id, {
      role: "user",
      content: JSON.stringify({
        preferences: {
          diet: preferences.diet,
          availability: preferences.availability,
          season: preferences.season,
        },
        numIngredients,
      }),
    });

    // Run the assistant
    const run = await openai.beta.threads.runs.create(thread.id, {
      assistant_id: defineSecret("OPENAI_ASSISTANT_ID").value(),
    });

    // Wait for completion
    let runStatus = await openai.beta.threads.runs.retrieve(thread.id, run.id);
    while (
      runStatus.status === "in_progress" ||
      runStatus.status === "queued"
    ) {
      await new Promise((resolve) => setTimeout(resolve, 1000));
      runStatus = await openai.beta.threads.runs.retrieve(thread.id, run.id);
    }

    if (runStatus.status === "completed") {
      // Get the assistant's response
      const messages = await openai.beta.threads.messages.list(thread.id);
      const lastMessage = messages.data[0];
      const textContent = lastMessage.content[0];

      if (textContent.type !== "text") {
        throw new Error("Expected text response from OpenAI");
      }

      const { status, ingredients, message } = JSON.parse(textContent.text.value);
      if (status == "error") {
        res.status(500).json({ error: message });
      } else {
        res.status(200).json(ingredients);
      }
    } else {
      res.status(500).json({ error: "Assistant run failed or timed out" });
    }
  } catch (error) {
    console.error("Error generating challenge:", error);
    res.status(500).json({
      error: "An error occurred while generating the challenge",
      details: error instanceof Error ? error.message : "Unknown error",
    });
  }
});
