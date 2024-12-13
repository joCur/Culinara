import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/screens/loading_screen.dart';
import '../controllers/challenge_history_controller.dart';
import '../widgets/history/challenge_history_filters.dart';
import '../widgets/history/challenge_history_search.dart';
import '../screens/challenge_details_screen.dart';
import '../../../common/presentation/widgets/gradient_background.dart';
import '../widgets/history/challenge_history_tile.dart';

class ChallengeHistoryScreen extends ConsumerStatefulWidget {
  static const String name = 'challenge-history';
  static const String path = '/history';

  const ChallengeHistoryScreen({super.key});

  @override
  ConsumerState<ChallengeHistoryScreen> createState() =>
      _ChallengeHistoryScreenState();
}

class _ChallengeHistoryScreenState
    extends ConsumerState<ChallengeHistoryScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyState = ref.watch(challengeHistoryControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.challenge_history_title.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilters(context),
          ),
        ],
      ),
      body: GradientBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ChallengeHistorySearch(
                controller: _searchController,
                onChanged: (value) => ref
                    .read(challengeHistoryControllerProvider.notifier)
                    .updateSearch(value),
              ),
            ),
            Expanded(
              child: historyState.when(
                data: (attempts) => attempts.isEmpty
                    ? Center(
                        child: Text(LocaleKeys.challenge_history_empty.tr()),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: attempts.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) => ChallengeHistoryTile(
                          attempt: attempts[index],
                          onTap: () => context.pushNamed(
                            ChallengeDetailsScreen.name,
                            pathParameters: {'id': attempts[index].id},
                          ),
                          onRetryPressed: (challenge) {
                            // Implementiere Logik für das Erstellen eines neuen Attempts
                          },
                        ),
                      ),
                loading: () =>
                    const LoadingScreen(message: 'Loading history...'),
                error: (error, _) => Center(
                  child: Text('Error: $error'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilters(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const ChallengeHistoryFilters(),
    );
  }
}
