import 'dart:io';

import 'package:flutter/foundation.dart';

class ErrorsStacktrace {
  static void printError({message, required StackTrace stackTrace, String? tag}) {
    if (!Platform.environment.containsKey('FLUTTER_TEST') && message != null) {
      final _tag = tag != null ? '[$tag!] ' : '';
      debugPrintStack(stackTrace: stackTrace, label: '$_tag\\Error: $message');
    }
  }
}
