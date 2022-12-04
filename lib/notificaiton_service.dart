import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class NotificaitonService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings androidIntializationSettings = AndroidInitializationSettings('logo');
  void intializeNotification() async {
    tz.initializeTimeZones();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidIntializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }

  void sendNotifications(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.high,
        priority: Priority.high
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(UniqueKey().hashCode, title, body, notificationDetails);
  }

  void schdeuledNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.high,
        priority: Priority.high
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        UniqueKey().hashCode,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 30)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }
  void resetAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}