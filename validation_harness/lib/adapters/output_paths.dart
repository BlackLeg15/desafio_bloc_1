import 'dart:io';

import 'package:path_provider/path_provider.dart';

class HarnessOutputPaths {
  HarnessOutputPaths({
    this.hostArtifactsDir = 'validation_harness/artifacts',
    this.hostReportsDir = 'validation_harness/reports',
    this.androidPackageName = 'com.example.desafio_bloc_1',
  });

  final String hostArtifactsDir;
  final String hostReportsDir;
  final String androidPackageName;

  bool get runsOnDevice => Platform.isAndroid || Platform.isIOS;

  /// Path used by `adb pull` on the host (no run-as required).
  String get androidAdbArtifactsPath =>
      '/storage/emulated/0/Android/data/$androidPackageName/files/validation_harness/artifacts';

  Directory hostArtifactsDirectory() => Directory(hostArtifactsDir);

  Directory hostReportsDirectory() => Directory(hostReportsDir);

  Future<Directory> deviceReportsDirectory() async {
    if (runsOnDevice) {
      final baseDir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();
      return Directory('${baseDir!.path}/validation_harness/reports');
    }

    return hostReportsDirectory();
  }

  Future<Directory> deviceArtifactsDirectory() async {
    if (runsOnDevice) {
      final baseDir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();
      return Directory('${baseDir!.path}/validation_harness/artifacts');
    }

    return hostArtifactsDirectory();
  }

  void ensureExists(Directory directory) {
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
  }
}
