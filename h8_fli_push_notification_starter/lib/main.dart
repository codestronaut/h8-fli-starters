import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:h8_fli_push_notification_starter/firebase_options.dart';
import 'package:h8_fli_push_notification_starter/pages/receipt_page.dart';
import 'package:h8_fli_push_notification_starter/pages/transaction_history_page.dart';
import 'package:h8_fli_push_notification_starter/services/fcm_handlers.dart';
import 'package:h8_fli_push_notification_starter/services/fcm_service.dart';
import 'package:h8_fli_push_notification_starter/services/notification_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // TODO: 1. Call FCMService initialize() method.
  final messaging = FirebaseMessaging.instance;
  final fcmService = FCMService(messaging: messaging);
  await fcmService.initialize();

  FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FCMHandlers.handleBackgroundMessage(message: message);
  NotificationService.showAlert(message: message);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FlutterLocalNotificationsPlugin _localNotificationPlugin;

  @override
  void initState() {
    _initLocalNotifications();
    super.initState();
  }

  void _initLocalNotifications() {
    _localNotificationPlugin = FlutterLocalNotificationsPlugin();
    _localNotificationPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          notificationCategories: [
            DarwinNotificationCategory(
              'category_act',
              actions: [
                DarwinNotificationAction.plain('act_open_app', 'Open App'),
                DarwinNotificationAction.text(
                  'act_reply',
                  'Reply',
                  buttonTitle: 'Send',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(),
        '/receipt': (context) => ReceiptPage(),
        '/transaction-history': (context) => TransactionHistoryPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.notifications_on_outlined,
                color: Colors.brown.shade300,
                size: 64.0,
              ),
              FilledButton(
                onPressed: () {
                  FlutterLocalNotificationsPlugin().show(
                    2,
                    'Notification on iOS',
                    'Manual triggered notification',
                    NotificationDetails(
                      iOS: DarwinNotificationDetails(
                        presentAlert: true,
                        presentBadge: true,
                        presentSound: true,
                      ),
                    ),
                  );
                },
                child: Text('Show iOS Local Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
