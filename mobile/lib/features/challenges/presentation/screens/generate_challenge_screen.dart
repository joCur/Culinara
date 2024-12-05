import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/exceptions/challenge_exception.dart';
import '../controllers/challenge_controller.dart';
import '../../../common/presentation/widgets/loading/cooking_loading_animation.dart';
import '../widgets/challenge/challenge_initial_view.dart';
import '../widgets/challenge/challenge_error_view.dart';
import '../widgets/ingredients/challenge_ingredients_list.dart';
import '../widgets/challenge/challenge_action_buttons.dart';
import '../../../common/presentation/constants/ui_constants.dart';

class GenerateChallengeScreen extends ConsumerWidget {
  static const String name = 'generate-challenge';
  static const String path = '/generate-challenge';

  const GenerateChallengeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengeState = ref.watch(challengeControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.challenge_title.tr()),
        backgroundColor: colorScheme.primaryContainer,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primaryContainer,
              colorScheme.surface,
              colorScheme.surface,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: challengeState.when(
                    data: (ingredients) {
                      if (ingredients == null) {
                        return const ChallengeInitialView();
                      }
                      return ChallengeIngredientsList(ingredients: ingredients);
                    },
                    loading: () => const CookingLoadingAnimation(),
                    error: (error, _) => ChallengeErrorView(
                      error: error is ChallengeException
                          ? error
                          : ChallengeException(
                              message: error.toString(),
                              type: ChallengeErrorType.unknown,
                              originalError: error,
                            ),
                    ),
                  ),
                ),
              ),
              VGap.sm,
              ChallengeActionButtons(challengeState: challengeState),
            ],
          ),
        ),
      ),
    );
  }
}
