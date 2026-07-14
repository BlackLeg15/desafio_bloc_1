import '../../core/interfaces/log_sink.dart';
import '../../core/models/log_entry.dart';

class InMemoryLogSink implements LogSink {
  final List<LogEntry> _entries = [];

  @override
  List<LogEntry> get entries => List.unmodifiable(_entries);

  @override
  void info(String message) => _add('INFO', message);

  @override
  void warn(String message) => _add('WARN', message);

  @override
  void error(String message, [Object? cause]) =>
      _add('ERROR', message, cause: cause?.toString());

  void _add(String level, String message, {String? cause}) {
    _entries.add(
      LogEntry(
        level: level,
        message: message,
        timestamp: DateTime.now(),
        cause: cause,
      ),
    );
  }
}
