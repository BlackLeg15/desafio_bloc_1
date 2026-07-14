import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:validation_harness/validation_harness.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('validation harness', (tester) async {
    final logs = InMemoryLogSink();
    final harness = ValidationHarness(
      driver: IntegrationTestDriver(tester),
      artifacts: IntegrationTestArtifactCollector(tester: tester),
      logs: logs,
      reporter: JsonReportWriter(),
    );

    final report = await harness.run([HomeLoadsPostsScenario()]);

    expect(
      report.passed,
      isTrue,
      reason: report.results
          .where((result) => !result.passed)
          .map((result) => result.error ?? result.name)
          .join('\n'),
    );
  });
}
