import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/challenge_attempt.dart';
import '../../controllers/challenge_history_controller.dart';

class ChallengeHistoryFilters extends ConsumerStatefulWidget {
  const ChallengeHistoryFilters({super.key});

  @override
  ConsumerState<ChallengeHistoryFilters> createState() =>
      _ChallengeHistoryFiltersState();
}

class _ChallengeHistoryFiltersState
    extends ConsumerState<ChallengeHistoryFilters> {
  final List<ChallengeStatus> _selectedStatus = [];
  DateTimeRange? _dateRange;
  final List<int> _selectedDifficulties = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            LocaleKeys.challenge_history_filters_title.tr(),
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildStatusFilter(),
          const SizedBox(height: 16),
          _buildDateFilter(),
          const SizedBox(height: 16),
          _buildDifficultyFilter(),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    ref
                        .read(challengeHistoryControllerProvider.notifier)
                        .resetFilters();
                    Navigator.pop(context);
                  },
                  child: Text(LocaleKeys.challenge_history_filters_reset.tr()),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    ref
                        .read(challengeHistoryControllerProvider.notifier)
                        .updateFilters(
                          statusFilter:
                              _selectedStatus.isEmpty ? null : _selectedStatus,
                          startDate: _dateRange?.start,
                          endDate: _dateRange?.end,
                          difficultyFilter: _selectedDifficulties.isEmpty
                              ? null
                              : _selectedDifficulties,
                        );
                    Navigator.pop(context);
                  },
                  child: Text(LocaleKeys.challenge_history_filters_apply.tr()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.challenge_history_filters_status.tr()),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: ChallengeStatus.values.map((status) {
            return FilterChip(
              label: Text(_getStatusText(status)),
              selected: _selectedStatus.contains(status),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedStatus.add(status);
                  } else {
                    _selectedStatus.remove(status);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.challenge_history_filters_date.tr()),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () async {
            final result = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
              initialDateRange: _dateRange,
            );
            if (result != null) {
              setState(() => _dateRange = result);
            }
          },
          icon: const Icon(Icons.calendar_today),
          label: Text(_dateRange == null
              ? LocaleKeys.challenge_history_filters_select_date.tr()
              : '${_dateRange!.start.toString().split(' ')[0]} - ${_dateRange!.end.toString().split(' ')[0]}'),
        ),
      ],
    );
  }

  Widget _buildDifficultyFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.challenge_history_filters_difficulty.tr()),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: List.generate(5, (index) {
            final difficulty = index + 1;
            return FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 16),
                  Text(
                      "${LocaleKeys.challenge_history_filters_difficulty}_$difficulty"
                          .tr()),
                ],
              ),
              selected: _selectedDifficulties.contains(difficulty),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedDifficulties.add(difficulty);
                  } else {
                    _selectedDifficulties.remove(difficulty);
                  }
                });
              },
            );
          }),
        ),
      ],
    );
  }

  String _getStatusText(ChallengeStatus status) {
    switch (status) {
      case ChallengeStatus.started:
        return LocaleKeys.challenge_history_filters_status_started.tr();
      case ChallengeStatus.completed:
        return LocaleKeys.challenge_history_filters_status_completed.tr();
      case ChallengeStatus.failed:
        return LocaleKeys.challenge_history_filters_status_failed.tr();
    }
  }
}
