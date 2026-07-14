import 'dart:io';

import 'package:desafio_bloc_1/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/interfaces/artifact_collector.dart';
import '../../core/interfaces/app_driver.dart';
import '../output_paths.dart';

class IntegrationTestDriver implements AppDriver {
  IntegrationTestDriver(this.tester);

  final WidgetTester tester;
  var _appLaunched = false;

  Finder _finderFor(String selector) {
    final keyFinder = find.byKey(ValueKey<String>(selector));
    if (keyFinder.evaluate().isNotEmpty) {
      return keyFinder;
    }

    final identifierFinder = find.bySemanticsIdentifier(selector);
    if (identifierFinder.evaluate().isNotEmpty) {
      return identifierFinder;
    }

    return find.bySemanticsLabel(selector);
  }

  @override
  Future<void> launchApp() async {
    if (_appLaunched) return;
    app.main();
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    _appLaunched = true;
  }

  @override
  Future<void> waitForVisible(
    String selector, {
    Duration timeout = const Duration(seconds: 30),
  }) async {
    final deadline = DateTime.now().add(timeout);

    while (DateTime.now().isBefore(deadline)) {
      await tester.pump(const Duration(milliseconds: 200));
      if (_finderFor(selector).evaluate().isNotEmpty) {
        return;
      }
    }

    throw StateError('Timeout waiting for selector: $selector');
  }

  Future<void> _pumpUi() async {
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  @override
  Future<void> tap(String selector) async {
    await waitForVisible(selector);
    await tester.tap(_finderFor(selector));
    await _pumpUi();
  }

  @override
  Future<void> scroll(String selector, {double delta = -300}) async {
    await waitForVisible(selector);
    await tester.drag(_finderFor(selector), Offset(0, delta));
    await _pumpUi();
  }

  @override
  Future<bool> isVisible(String selector) async {
    await tester.pump(const Duration(milliseconds: 100));
    return _finderFor(selector).evaluate().isNotEmpty;
  }

  @override
  Future<void> closeApp() async {
    await _pumpUi();
  }
}

class IntegrationTestArtifactCollector implements ArtifactCollector {
  IntegrationTestArtifactCollector({
    required this.tester,
    HarnessOutputPaths? outputPaths,
  }) : _outputPaths = outputPaths ?? HarnessOutputPaths();

  final WidgetTester tester;
  final HarnessOutputPaths _outputPaths;
  final binding = IntegrationTestWidgetsFlutterBinding.instance;
  var _surfaceConverted = false;

  @override
  Future<String> captureScreenshot(String name) async {
    final sanitizedName = name.replaceAll(RegExp(r'[^\w\-]+'), '_');

    try {
      if (!_surfaceConverted) {
        await binding.convertFlutterSurfaceToImage();
        await tester.pump(const Duration(milliseconds: 500));
        _surfaceConverted = true;
      }

      final bytes = await binding
          .takeScreenshot(sanitizedName)
          .timeout(const Duration(seconds: 30));

      final directory = await _outputPaths.deviceArtifactsDirectory();
      _outputPaths.ensureExists(directory);

      final file = File('${directory.path}/$sanitizedName.png');
      await file.writeAsBytes(bytes, flush: true);

      debugPrint('HARNESS_SCREENSHOT:${file.path}');
      return file.path;
    } catch (error) {
      debugPrint('Screenshot skipped ($sanitizedName): $error');
      return 'skipped:$sanitizedName';
    }
  }

  @override
  Future<void> startVideoRecording() async {}

  @override
  Future<String?> stopVideoRecording() async => null;
}
