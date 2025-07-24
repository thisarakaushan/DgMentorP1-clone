import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static List<Map<String, dynamic>> _notifications = [];
  static Function? _onNotificationUpdate; // Callback for UI updates

  static void setOnNotificationUpdate(Function callback) {
    _onNotificationUpdate = callback;
  }

  static Future<void> initialize() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');

    RemoteMessage? initialMessage = await _firebaseMessaging
        .getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    await _flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
    loadNotifications();
  }

  static void _handleForegroundMessage(RemoteMessage message) {
    _handleMessage(message);
    _showNotification(message);
    _notifyUpdate();
  }

  static void _handleMessage(RemoteMessage message) {
    _notifications.insert(0, {
      'title': message.notification?.title ?? 'New Notification',
      'body': message.notification?.body ?? 'Check this out!',
      'isRead': false,
      'timestamp': DateTime.now().toIso8601String(),
    });
    _notifyUpdate();
  }

  static Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
        );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await _flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
    );
  }

  static void loadNotifications() {
    _notifications = [
      {
        'title': 'New Course Available',
        'body': 'Check out Finclusion!',
        'isRead': false,
        'timestamp': DateTime.now()
            .subtract(const Duration(minutes: 10))
            .toIso8601String(),
      },
      {
        'title': 'Quiz Reminder',
        'body': 'Your quiz starts soon!',
        'isRead': true,
        'timestamp': DateTime.now()
            .subtract(const Duration(hours: 2))
            .toIso8601String(),
      },
      {
        'title': 'Update Released',
        'body': 'New features added!',
        'isRead': false,
        'timestamp': DateTime.now()
            .subtract(const Duration(days: 1))
            .toIso8601String(),
      },
    ];
    _notifyUpdate();
  }

  static List<Map<String, dynamic>> getNotifications() => _notifications;

  static void markAsRead(int index) {
    if (index >= 0 && index < _notifications.length) {
      _notifications[index]['isRead'] = true;
      _notifyUpdate();
    }
  }

  static int getUnreadCount() =>
      _notifications.where((n) => !(n['isRead'] as bool? ?? true)).length;

  static void _notifyUpdate() {
    if (_onNotificationUpdate != null) {
      _onNotificationUpdate!();
    }
  }
}
