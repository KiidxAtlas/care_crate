import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Logger service for debugging and monitoring
class LoggerService {
  static const bool _isDebugMode = true; // Set based on build mode

  static void debug(String message, [String? tag]) {
    if (_isDebugMode) {
      print('[DEBUG]${tag != null ? ' [$tag]' : ''}: $message');
    }
  }

  static void info(String message, [String? tag]) {
    print('[INFO]${tag != null ? ' [$tag]' : ''}: $message');
  }

  static void warning(String message, [String? tag]) {
    print('[WARNING]${tag != null ? ' [$tag]' : ''}: $message');
  }

  static void error(String message, [String? tag, dynamic error]) {
    print('[ERROR]${tag != null ? ' [$tag]' : ''}: $message');
    if (error != null) {
      print('Error details: $error');
    }
  }
}

/// Provider for logger service
final loggerProvider = Provider<LoggerService>((ref) {
  return LoggerService();
});
