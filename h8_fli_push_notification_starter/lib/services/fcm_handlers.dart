import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:h8_fli_push_notification_starter/services/notification_service.dart';

class FCMHandlers {
  // TODO: 1. Complete the handleForegroundMessage() implementation.
  /// This static method should accept RemoteMessage as the input.
  static Future<void> handleForegroundMessage({
    required RemoteMessage message,
  }) async {
    log('FOREGROUND');
    log('Message ID: ${message.messageId}');
    log('Message data: ${message.data}');
    log('Message title: ${message.notification?.title}');
    log('Message body: ${message.notification?.body}');

    NotificationService.showAlert(message: message);
  }

  // TODO: 2. Complete the handleBackgroundMessage() implementation.
  /// This static method should accept RemoteMessage as the input.
  static Future<void> handleBackgroundMessage({
    required RemoteMessage message,
  }) async {
    log('BACKGROUND');
    log('Message ID: ${message.messageId}');
    log('Message data: ${message.data}');
    log('Message title: ${message.notification?.title}');
    log('Message body: ${message.notification?.body}');
  }
}
