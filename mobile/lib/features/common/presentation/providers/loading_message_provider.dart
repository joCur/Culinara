import 'dart:async';
import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../generated/locale_keys.g.dart';

part 'loading_message_provider.g.dart';

enum LoadingContext {
  generateChallenge,
  challengeDetails,
  saveChallenge,
}

@riverpod
class LoadingMessageNotifier extends _$LoadingMessageNotifier {
  final _random = Random();
  Timer? _timer;

  @override
  String build(LoadingContext context) {
    ref.onDispose(() {
      _timer?.cancel();
    });

    // Start rotating messages
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => _refresh(context),
    );

    return _getRandomMessage(context);
  }

  String _getRandomMessage(LoadingContext context) {
    final messages = _getMessagesForContext(context);
    return messages[_random.nextInt(messages.length)].tr();
  }

  List<String> _getMessagesForContext(LoadingContext context) {
    switch (context) {
      case LoadingContext.generateChallenge:
        return [
          LocaleKeys.challenge_loading_generate_checkFridge,
          LocaleKeys.challenge_loading_generate_checkPantry,
          LocaleKeys.challenge_loading_generate_checkSpices,
          LocaleKeys.challenge_loading_generate_getIngredients,
          LocaleKeys.challenge_loading_generate_consultChef,
          LocaleKeys.challenge_loading_generate_checkCookbook,
        ];
      case LoadingContext.challengeDetails:
        return [
          LocaleKeys.challenge_loading_details_setTable,
          LocaleKeys.challenge_loading_details_getApron,
          LocaleKeys.challenge_loading_details_washIngredients,
          LocaleKeys.challenge_loading_details_prepareKitchen,
          LocaleKeys.challenge_loading_details_sharpenKnives,
          LocaleKeys.challenge_loading_details_preheatOven,
        ];
      case LoadingContext.saveChallenge:
        return [
          LocaleKeys.challenge_loading_save_writeRecipe,
          LocaleKeys.challenge_loading_save_takePhoto,
          LocaleKeys.challenge_loading_save_shareMasterpiece,
          LocaleKeys.challenge_loading_save_cleanKitchen,
        ];
    }
  }

  void _refresh(LoadingContext context) {
    state = _getRandomMessage(context);
  }
}
