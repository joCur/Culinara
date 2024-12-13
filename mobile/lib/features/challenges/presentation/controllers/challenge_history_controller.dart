import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../data/repositories/challenge_repository.dart';

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

  @override
  Future<List<ChallengeAttempt>> build() async {
    return _loadAttempts();
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

  Future<void> updateSearch(String query) async {
    _filters = _filters.copyWith(searchQuery: query.isEmpty ? null : query);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadAttempts());
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
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadAttempts());
  }

  Future<void> resetFilters() async {
    _filters = const HistoryFilters();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadAttempts());
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadAttempts());
  }
}
