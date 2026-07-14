import 'interfaces/app_driver.dart';
import 'interfaces/artifact_collector.dart';
import 'interfaces/log_sink.dart';
import 'interfaces/report_writer.dart';
import 'interfaces/scenario.dart';
import 'models/scenario_result.dart';
import 'models/validation_report.dart';

class ValidationHarness {
  ValidationHarness({
    required this.driver,
    required this.artifacts,
    required this.logs,
    required this.reporter,
  });

  final AppDriver driver;
  final ArtifactCollector artifacts;
  final LogSink logs;
  final ReportWriter reporter;

  Future<ValidationReport> run(List<Scenario> scenarios) async {
    final startedAt = DateTime.now();
    final results = <ScenarioResult>[];

    await driver.launchApp();

    for (final scenario in scenarios) {
      logs.info('Running scenario: ${scenario.name}');
      final scenarioStartedAt = DateTime.now();

      try {
        final result = await scenario.run(
          driver: driver,
          artifacts: artifacts,
          logs: logs,
        );
        results.add(result);
        logs.info(
          result.passed
              ? 'Scenario passed: ${scenario.name}'
              : 'Scenario failed: ${scenario.name}',
        );
      } catch (error, stackTrace) {
        logs.error('Scenario crashed: ${scenario.name}', error);
        await artifacts.captureScreenshot('error_${scenario.name}');
        results.add(
          ScenarioResult.failed(
            scenario.name,
            DateTime.now().difference(scenarioStartedAt),
            '$error\n$stackTrace',
          ),
        );
      }
    }

    await driver.closeApp();

    final finishedAt = DateTime.now();
    final reportPath = await reporter.write(
      ValidationReport(
        startedAt: startedAt,
        finishedAt: finishedAt,
        results: results,
        logs: logs.entries,
        reportPath: '',
      ),
    );

    return ValidationReport(
      startedAt: startedAt,
      finishedAt: finishedAt,
      results: results,
      logs: logs.entries,
      reportPath: reportPath,
    );
  }
}
