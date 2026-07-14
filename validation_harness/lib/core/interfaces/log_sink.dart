import '../models/log_entry.dart';

abstract class LogSink {
  void info(String message);
  void warn(String message);
  void error(String message, [Object? cause]);
  List<LogEntry> get entries;
}
