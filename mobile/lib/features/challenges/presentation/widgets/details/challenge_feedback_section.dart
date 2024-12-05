import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge_attempt.dart';

class ChallengeFeedbackSection extends StatefulWidget {
  final ChallengeAttempt attempt;
  final Function(String feedback, int rating) onFeedbackSubmitted;

  const ChallengeFeedbackSection({
    super.key,
    required this.attempt,
    required this.onFeedbackSubmitted,
  });

  @override
  State<ChallengeFeedbackSection> createState() =>
      _ChallengeFeedbackSectionState();
}

class _ChallengeFeedbackSectionState extends State<ChallengeFeedbackSection> {
  final _feedbackController = TextEditingController();
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _feedbackController.text = widget.attempt.feedback ?? '';
    _rating = widget.attempt.rating ?? 0;
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.challenge_details_feedback_title.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VGap.md,
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(
                hintText: LocaleKeys.challenge_details_feedback_hint.tr(),
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            VGap.md,
            Row(
              children: List.generate(
                5,
                (index) => IconButton(
                  onPressed: () => setState(() => _rating = index + 1),
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            VGap.md,
            FilledButton(
              onPressed: () {
                widget.onFeedbackSubmitted(
                  _feedbackController.text,
                  _rating,
                );
              },
              child: Text(LocaleKeys.challenge_details_feedback_submit.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
