import 'package:desafio_bloc_1/app/core/constants/validation_keys.dart';

import '../../core/interfaces/app_driver.dart';
import '../../core/interfaces/artifact_collector.dart';
import '../../core/interfaces/log_sink.dart';
import '../../core/interfaces/scenario.dart';
import '../../core/models/scenario_result.dart';

class HomeLoadsPostsScenario implements Scenario {
  @override
  String get name => 'home_loads_posts';

  @override
  String get description =>
      'Launch app, wait for posts list, capture screenshots, verify at least one card.';

  Future<bool> _isErrorStateVisible(AppDriver driver) async {
    return driver.isVisible(ValidationKeys.retryButton);
  }

  @override
  Future<ScenarioResult> run({
    required AppDriver driver,
    required ArtifactCollector artifacts,
    required LogSink logs,
  }) async {
    final startedAt = DateTime.now();
    final screenshots = <String>[];

    try {
      final loadingVisible = await driver.isVisible(ValidationKeys.homeLoading);
      if (loadingVisible) {
        logs.info('Loading indicator visible');
      }

      final deadline = DateTime.now().add(const Duration(seconds: 45));
      while (DateTime.now().isBefore(deadline)) {
        if (await driver.isVisible(ValidationKeys.postsList)) {
          break;
        }
        if (await _isErrorStateVisible(driver)) {
          throw StateError('App entered error state — API may have failed');
        }
        await Future<void>.delayed(const Duration(milliseconds: 500));
      }

      if (!await driver.isVisible(ValidationKeys.postsList)) {
        throw StateError('Timeout waiting for posts list');
      }

      logs.info('Posts list visible');
      screenshots.add(await artifacts.captureScreenshot('02_posts_loaded'));

      final hasCard = await driver.isVisible(ValidationKeys.blogPostCard);
      if (!hasCard) {
        throw StateError('Expected at least one blog post card');
      }

      logs.info('At least one blog post card is visible');

      return ScenarioResult.success(
        name,
        DateTime.now().difference(startedAt),
        screenshots: screenshots,
      );
    } catch (error) {
      screenshots.add(await artifacts.captureScreenshot('error_$name'));
      return ScenarioResult.failed(
        name,
        DateTime.now().difference(startedAt),
        error,
        screenshots: screenshots,
      );
    }
  }
}
