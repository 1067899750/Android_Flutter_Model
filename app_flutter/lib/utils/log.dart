import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static const String SYMBOL = "flutter =====>";

  static Logger logger = Logger();

  static info(dynamic info, {String? tag}) {
    if (kDebugMode) {
      logger.i('$SYMBOL#$tag# ${info.toString()}');
    }
  }

  static warn(dynamic info, {String? tag}) {
    if (kDebugMode) {
      logger.w('$SYMBOL#$tag# ${info.toString()}');
    }
  }

  static error(dynamic info, {String? tag}) {
    if (kDebugMode) {
      logger.e('$SYMBOL#$tag# ${info.toString()}');
    }
  }
}
