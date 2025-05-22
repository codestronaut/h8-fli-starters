import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:h8_fli_push_notification_starter/main.dart';

class NotificationService {
  static void showAlert({required RemoteMessage message}) {
    FlutterLocalNotificationsPlugin().show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          '1',
          'notification_1',
          channelDescription: 'notification_1',
          importance: Importance.max,
          priority: Priority.high,
          actions: [
            AndroidNotificationAction(
              'act_open_page',
              'Open Page',
              showsUserInterface: true,
            ),
            AndroidNotificationAction(
              'act_reply',
              'Reply',
              showsUserInterface: true,
              inputs: [
                AndroidNotificationActionInput(label: 'Enter your message'),
              ],
            ),
          ],
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }

  static void handleClickToAction({required RemoteMessage message}) {
    final data = message.data;
    if (data.containsKey('destination')) {
      final currentContext = navigatorKey.currentContext;
      if (currentContext != null) {
        Navigator.of(currentContext).pushNamed(data['destination']);
      }
    }
  }
}
