class LogEntry {
  const LogEntry({
    required this.level,
    required this.message,
    required this.timestamp,
    this.cause,
  });

  final String level;
  final String message;
  final DateTime timestamp;
  final String? cause;

  Map<String, dynamic> toJson() => {
        'level': level,
        'message': message,
        'timestamp': timestamp.toIso8601String(),
        if (cause != null) 'cause': cause,
      };
}
