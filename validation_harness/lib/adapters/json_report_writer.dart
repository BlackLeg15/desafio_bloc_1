import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../core/interfaces/report_writer.dart';
import '../../core/models/validation_report.dart';
import 'output_paths.dart';

class JsonReportWriter implements ReportWriter {
  JsonReportWriter({
    HarnessOutputPaths? outputPaths,
  }) : _outputPaths = outputPaths ?? HarnessOutputPaths();

  final HarnessOutputPaths _outputPaths;

  @override
  Future<String> write(ValidationReport report) async {
    final directory = await _outputPaths.deviceReportsDirectory();
    _outputPaths.ensureExists(directory);

    final timestamp = report.startedAt.toIso8601String().replaceAll(':', '-');
    final reportFile = File('${directory.path}/validation_report_$timestamp.json');
    final latestFile = File('${directory.path}/validation_report_latest.json');

    final payload = report.toJson()..['reportPath'] = reportFile.path;
    final encoded = const JsonEncoder.withIndent('  ').convert(payload);

    await reportFile.writeAsString(encoded);
    await latestFile.writeAsString(encoded);

    debugPrint('VALIDATION_REPORT_JSON:$encoded');

    return reportFile.path;
  }
}
