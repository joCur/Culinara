import 'dart:async';
import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => _refresh(context),
    );

    return _getRandomMessage(context);
  }

  String _getRandomMessage(LoadingContext context) {
    final messages = _getMessagesForContext(context);
    return messages[_random.nextInt(messages.length)];
  }

  List<String> _getMessagesForContext(LoadingContext context) {
    final basePath = switch (context) {
      LoadingContext.generateChallenge => 'challenge.loading.generate',
      LoadingContext.challengeDetails => 'challenge.loading.details',
      LoadingContext.saveChallenge => 'challenge.loading.save',
    };

    final translations = <String>[];
    var index = 0;

    while (true) {
      final key = '$basePath.$index';
      final translation = key.tr();

      if (translation == key) break;

      translations.add(translation);
      index++;
    }

    return translations;
  }

  void _refresh(LoadingContext context) {
    state = _getRandomMessage(context);
  }
}
