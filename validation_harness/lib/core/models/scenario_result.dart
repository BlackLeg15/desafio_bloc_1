class ScenarioResult {
  const ScenarioResult({
    required this.name,
    required this.passed,
    required this.duration,
    this.error,
    this.screenshots = const [],
  });

  final String name;
  final bool passed;
  final Duration duration;
  final String? error;
  final List<String> screenshots;

  factory ScenarioResult.success(
    String name,
    Duration duration, {
    List<String> screenshots = const [],
  }) =>
      ScenarioResult(
        name: name,
        passed: true,
        duration: duration,
        screenshots: screenshots,
      );

  factory ScenarioResult.failed(
    String name,
    Duration duration,
    Object error, {
    List<String> screenshots = const [],
  }) =>
      ScenarioResult(
        name: name,
        passed: false,
        duration: duration,
        error: error.toString(),
        screenshots: screenshots,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'passed': passed,
        'durationMs': duration.inMilliseconds,
        if (error != null) 'error': error,
        'screenshots': screenshots,
      };
}
