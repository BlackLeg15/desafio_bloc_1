import '../models/scenario_result.dart';
import 'app_driver.dart';
import 'artifact_collector.dart';
import 'log_sink.dart';

abstract class Scenario {
  String get name;
  String get description;

  Future<ScenarioResult> run({
    required AppDriver driver,
    required ArtifactCollector artifacts,
    required LogSink logs,
  });
}
