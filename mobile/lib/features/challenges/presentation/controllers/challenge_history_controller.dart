import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../data/repositories/challenge_repository.dart';
import 'challenge_details_controller.dart';

part 'challenge_history_controller.g.dart';

class HistoryFilters {
  final String? searchQuery;
  final List<ChallengeStatus>? statusFilter;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<int>? difficultyFilter;

  const HistoryFilters({
    this.searchQuery,
    this.statusFilter,
    this.startDate,
    this.endDate,
    this.difficultyFilter,
  });

  HistoryFilters copyWith({
    String? searchQuery,
    List<ChallengeStatus>? statusFilter,
    DateTime? startDate,
    DateTime? endDate,
    List<int>? difficultyFilter,
  }) {
    return HistoryFilters(
      searchQuery: searchQuery ?? this.searchQuery,
      statusFilter: statusFilter ?? this.statusFilter,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      difficultyFilter: difficultyFilter ?? this.difficultyFilter,
    );
  }
}

@riverpod
class ChallengeHistoryController extends _$ChallengeHistoryController {
  HistoryFilters _filters = const HistoryFilters();
  List<ChallengeAttempt> _attempts = [];

  @override
  Future<List<ChallengeAttempt>> build() async {
    _attempts = await _loadAttempts();
    return _attempts;
  }

  Future<List<ChallengeAttempt>> _loadAttempts() {
    final userId = ref.read(userProfileProvider).value?.uid;
    if (userId == null) return Future.value([]);

    return ref.read(challengeRepositoryProvider).getChallengeAttempts(
          userId: userId,
          searchQuery: _filters.searchQuery,
          statusFilter: _filters.statusFilter,
          startDate: _filters.startDate,
          endDate: _filters.endDate,
          difficultyFilter: _filters.difficultyFilter,
        );
  }

  void updateSearch(String query) {
    state = const AsyncValue.loading();
    _filters = _filters.copyWith(searchQuery: query);
    if (query.isEmpty) {
      _applyFilters();
      return;
    }

    final filteredAttempts = _attempts.where((attempt) {
      final challenge =
          ref.read(challengeDetailsProvider(attempt.challengeRef)).valueOrNull;
      if (challenge == null) return false;

      final searchLower = query.toLowerCase();
      final ingredients =
          challenge.ingredients.map((i) => i.name.toLowerCase()).join(' ');
      final dishName = attempt.reflection?.dishName.toLowerCase() ?? '';

      return ingredients.contains(searchLower) ||
          dishName.contains(searchLower);
    }).toList();

    state = AsyncValue.data(filteredAttempts);
  }

  void _applyFilters() {
    if (_attempts.isEmpty) return;

    var filtered = _attempts;

    if (_filters.statusFilter != null) {
      filtered = filtered
          .where((a) => _filters.statusFilter!.contains(a.status))
          .toList();
    }

    if (_filters.startDate != null && _filters.endDate != null) {
      filtered = filtered
          .where((a) =>
              a.startedAt.isAfter(_filters.startDate!) &&
              a.startedAt
                  .isBefore(_filters.endDate!.add(const Duration(days: 1))))
          .toList();
    }

    if (_filters.difficultyFilter != null &&
        _filters.difficultyFilter!.isNotEmpty) {
      filtered = filtered
          .where((a) =>
              a.reflection != null &&
              _filters.difficultyFilter!
                  .contains(a.reflection!.difficultyRating))
          .toList();
    }

    if (_filters.searchQuery?.isNotEmpty ?? false) {
      filtered = filtered.where((attempt) {
        final challenge = ref
            .read(challengeDetailsProvider(attempt.challengeRef))
            .valueOrNull;
        if (challenge == null) return false;

        final searchLower = _filters.searchQuery!.toLowerCase();
        final ingredients =
            challenge.ingredients.map((i) => i.name.toLowerCase()).join(' ');
        final dishName = attempt.reflection?.dishName.toLowerCase() ?? '';

        return ingredients.contains(searchLower) ||
            dishName.contains(searchLower);
      }).toList();
    }

    state = AsyncValue.data(filtered);
  }

  Future<void> updateFilters({
    List<ChallengeStatus>? statusFilter,
    DateTime? startDate,
    DateTime? endDate,
    List<int>? difficultyFilter,
  }) async {
    _filters = _filters.copyWith(
      statusFilter: statusFilter,
      startDate: startDate,
      endDate: endDate,
      difficultyFilter: difficultyFilter,
    );
    _applyFilters();
  }

  Future<void> resetFilters() async {
    _filters = const HistoryFilters();
    _applyFilters();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    _attempts = await _loadAttempts();
    _applyFilters();
  }
}

@riverpod
class IsSearching extends _$IsSearching {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }

  void reset() {
    state = false;
  }
}
