import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:timezone/timezone.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

List allnotifications = [
  'notify1',
  'notify2',
  'notify3',
  'notify4',
  'notify5',
  'notify6',
  'notify7',
  'notify8',
];

List myNotifications = [
  'notify2',
  'notify3',
];
class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/logo_android');
    const DarwinInitializationSettings iosInitialisationSettings =
        DarwinInitializationSettings();
    const InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitialisationSettings);
    await _localNotificationService.initialize(settings);
  }

  Future<NotificationDetails> _notificationDetails(notifyID) async {
     AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('$notifyID', 'chanel_name',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(presentSound: false);

    return NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

//уведомление без полезной нагрузки
  Future<void> showNotification({

    required int id,
    required String title,
    required String body,
  }) async {
    _localNotificationService.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
    final details = await _notificationDetails(id);
    try {
      await _localNotificationService.show(id, title, body, details);
    } catch (er) {
      print('$er eroooooor');
    }
    ;
  }

//уведомление с задержкой
  /*Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required int seconds,
  }) async {
    _localNotificationService
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    final details = await _notificationDetails(id);
    try {
      await _localNotificationService.zonedSchedule(
          id,
          title,
          body,
          TZDateTime.from(
              DateTime.now().add(Duration(seconds: seconds)), local),
          details,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    } catch (er) {
      print('$er eroooooor');
    }
    ;
  }*/
}
