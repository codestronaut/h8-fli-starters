import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:h8_fli_push_notification_starter/services/fcm_handlers.dart';
import 'package:h8_fli_push_notification_starter/services/notification_service.dart';

class FCMService {
  FCMService({required this.messaging});
  final FirebaseMessaging messaging;

  // TODO: 2. Complete the initialize() implementation.
  Future<void> initialize() async {
    // TODO: 2.1. Request permission for notifications.
    final settings = await messaging.requestPermission();
    final status = settings.authorizationStatus;
    if (status == AuthorizationStatus.authorized) {
      // TODO: 2.2. Get FirebaseMessaging token.
      /// The token is needed for sending a test push notification message
      /// from Firebase console. Log the value to access the token.
      final token = await messaging.getToken();
      log(token.toString(), name: 'FCM Token');

      final apnsToken = await messaging.getAPNSToken();
      log(apnsToken.toString(), name: 'FCM APNs Token');

      // TODO: 2.3. Add FirebaseMessaging onMessage listener implementation.
      FirebaseMessaging.onMessage.listen((message) async {
        log('A message has been received in foreground: ${message.data}');
        FCMHandlers.handleForegroundMessage(message: message);
        NotificationService.handleClickToAction(message: message);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        NotificationService.handleClickToAction(message: message);
      });
    }
  }
}
