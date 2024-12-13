import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';

class ChallengeHistorySearch extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const ChallengeHistorySearch({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: LocaleKeys.challenge_history_search_hint.tr(),
      leading: const Icon(Icons.search),
      trailing: [
        if (controller.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              controller.clear();
              onChanged('');
            },
          ),
      ],
      onChanged: onChanged,
    );
  }
}
