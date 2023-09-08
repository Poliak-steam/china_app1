import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../vars/variables.dart';

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/logo_android');
    const DarwinInitializationSettings iosInitialisationSettings =
        DarwinInitializationSettings();
    const DarwinNotificationDetails darwinDetailsForDownloads =
        DarwinNotificationDetails(
      presentSound: false,
      presentAlert: false,
      presentBanner: true,
      presentBadge: true,
      presentList: true,
      badgeNumber: 2,
    );
    const InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitialisationSettings);
    await _localNotificationService.initialize(settings);
  }

  DarwinNotificationDetails darwinDetailsForDownloads =
      const DarwinNotificationDetails(
    presentSound: false,
    presentAlert: false,
    presentBanner: false,
    presentBadge: false,
    presentList: false,
    badgeNumber: 2,
  );

  Future<NotificationDetails> _notificationDetails(notifyID) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('$notifyID', 'android_local_notify',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentSound: false,
    );

    return NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

//уведомление без полезной нагрузки
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    _localNotificationService
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    final details = await _notificationDetails(id);
    try {
      await _localNotificationService.show(id, title, body, details);
    } catch (er) {
      print('$er notify error');
    }
    ;
  }

  //уведомление  загрузки
  Future<void> showDownloadNotify({
    required int id,
    required String title,
    required String body,
  }) async {
    try {
      await _localNotificationService.show(
          id, title, body, NotificationDetails(iOS: darwinDetailsForDownloads));
    } catch (er) {
      print('$er notify error');
    }
    ;
  }
}

Future<void> notifyListeners() async {
  //Запрос на показ уведомлений
  final result = await Permission.notification.request();
  //await iosRequest(); хз нужен ли он

  if(result.isGranted) {
    // Подписка на фоновые уведомления
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    //Инициализация локальных уведомлений
    await service.initialize();
    //Подписка на foreground уведомления
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      service.showNotification(
          id: 1,
          title: message.notification?.title ?? 'notify have no body',
          body: message.notification?.body ?? 'notify have no body');
    });
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
