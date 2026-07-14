import '../models/validation_report.dart';

abstract class ReportWriter {
  Future<String> write(ValidationReport report);
}
