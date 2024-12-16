import * as functions from "firebase-functions";
import { defineSecret } from "firebase-functions/params";
import OpenAI from "openai";
import * as admin from "firebase-admin";
import * as logger from "firebase-functions/logger";

// Initialize admin if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

interface ChallengeData {
  preferences: {
    diet: string[];
    availability: string;
    season: string[];
  };
  numIngredients: number;
}

export const generateChallenge = functions.https.onCall<ChallengeData>(async (data) => {
  try {
    // Verify authentication
    if (!data?.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "The function must be called while authenticated."
      );
    }

    const { preferences, numIngredients } = data.data;

    if (!preferences || !numIngredients) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Missing required parameters"
      );
    }

    // Validate that diet and season are arrays
    if (!Array.isArray(preferences.diet) || !Array.isArray(preferences.season)) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Diet and season must be arrays"
      );
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
      const messages = await openai.beta.threads.messages.list(thread.id);
      const lastMessage = messages.data[0];
      const textContent = lastMessage.content[0];

      if (textContent.type !== "text") {
        throw new functions.https.HttpsError(
          "internal",
          "Expected text response from OpenAI"
        );
      }

      const { status, name, ingredients, message } = JSON.parse(textContent.text.value);
      if (status == "error") {
        throw new functions.https.HttpsError("internal", message);
      }

      return {
        name,
        ingredients,
      };
    } else {
      throw new functions.https.HttpsError(
        "internal",
        "Assistant run failed or timed out"
      );
    }
  } catch (error) {
    logger.error("Error generating challenge:", error);
    if (error instanceof functions.https.HttpsError) {
      throw error;
    }
    throw new functions.https.HttpsError(
      "internal",
      "An error occurred while generating the challenge",
      error instanceof Error ? error.message : "Unknown error"
    );
  }
});
