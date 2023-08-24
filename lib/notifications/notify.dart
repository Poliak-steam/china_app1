import 'package:flutter/cupertino.dart';
import 'package:timezone/timezone.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings  androidInitializationSettings = AndroidInitializationSettings('@mipmap/logo_android');

    final InitializationSettings settings = const InitializationSettings(android: androidInitializationSettings);
    await _localNotificationService.initialize(settings, onDidReceiveNotificationResponse: (details) {
      _onDidReceiveNotificationResponse;
    });
  }


Future<NotificationDetails> _notificationDetails() async {
  const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
    'chanel_id',
    'chanel_name',
    channelDescription: 'description',
    importance: Importance.max,
    priority: Priority.max,
    playSound: true
  );

  return NotificationDetails(android: androidNotificationDetails);
}

//уведомление без полезной нагрузки

Future<void> showNotification({
  required int id,
  required String title,
  required String body,
}) async {
    final details = await _notificationDetails();
  try{await _localNotificationService.show(id, title, body, details);} catch (er) {
    print('$er eroooooor');
  };

}

void _onDidReceiveNotificationResponse(int id, String? titile, String? body, String? payload) {
  print('id $id');
}



}

















