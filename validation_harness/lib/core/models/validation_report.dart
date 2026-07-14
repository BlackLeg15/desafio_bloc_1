import 'log_entry.dart';
import 'scenario_result.dart';

class ValidationReport {
  const ValidationReport({
    required this.startedAt,
    required this.finishedAt,
    required this.results,
    required this.logs,
    required this.reportPath,
  });

  final DateTime startedAt;
  final DateTime finishedAt;
  final List<ScenarioResult> results;
  final List<LogEntry> logs;
  final String reportPath;

  bool get passed => results.every((result) => result.passed);

  Map<String, dynamic> toJson() => {
        'passed': passed,
        'startedAt': startedAt.toIso8601String(),
        'finishedAt': finishedAt.toIso8601String(),
        'durationMs': finishedAt.difference(startedAt).inMilliseconds,
        'reportPath': reportPath,
        'results': results.map((result) => result.toJson()).toList(),
        'logs': logs.map((log) => log.toJson()).toList(),
      };
}
