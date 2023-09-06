import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hl_flutter_app/networking/network_func.dart';
import 'package:hl_flutter_app/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:hl_flutter_app/networking/data_requests.dart';
import 'package:hl_flutter_app/networking/request_vars.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../Collections/status_col.dart';
import '../Collections/transit_col.dart';
import '../networking/parsing.dart';
import '../notifications/notify.dart';

List<Status> statusesList = [];
Map<String, dynamic> transits = {};
List<Map<String, dynamic>> statuses = [];
List<Transit> transitsList = [];
late Isar isar;
late LocalNotificationService service;

class StartVars {
  static Future getVars(bool conn) async {
    //ОТКРЫТИЕ ЛОКАЛЬНОЙ БАЗЫ
    final dbDir = Platform.isAndroid
        ? (await getApplicationDocumentsDirectory())
        : (await getLibraryDirectory());
    isar = await Isar.open(
      [TransitSchema, DocsSchema, StatusInfoSchema,StatusSchema],
      directory: dbDir.path,
    );






    if(conn) {
      // ЗАПИСЬ В ХРАНИЛИЩЕ
      final token = await postApi(RequestVar.getTokenRequest());
      await SecureStorage.setToken(token['result']);
      await SecureStorage.setBasicAuth('admin', 'ugUYT76hjg');
      //ПОЛУЧЕНИЕ ГРУЗОВ
      final Map CargosResp =
      await postApi(await RequestVar.getCargosListRequest());
      transits = CargosResp['result']['baggages'] as Map<String, dynamic>;

      for (int i = 0; i < transits.length; i++) {
        transits.removeWhere((key, value) => key.startsWith('c'));
      }
      transitsList = await getTransitInfo();

      //ПОЛУЧЕНИЕ СТАТУСОВ
      statuses =
          ((await postApi(await RequestVar.getStatusRequest()))['result'] as List)
              .map((e) => e as Map<String, dynamic>)
              .toList();
      statusesList = await getStatusInfo();
      //ИНИЦИАЛИЗАЦИЯ ЛОКАЛЬНЫХ УВЕДОМЛЕНИЙ
      service = LocalNotificationService();
      await service.initialize();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        service.showNotification(
            id: 1,
            title: message.notification?.title ?? 'notify have no body',
            body: message.notification?.body ?? 'notify have no body');
      });
    } else {
      await isar.writeTxn(() async {
        statusesList = await isar.status.where().findAll();
        transitsList = await isar.transits.where().findAll();

      });
    }
  }

  static Future<bool> updateLocalDB() async {
    if ((await isConnected()) && (await isApiConnected())) {
      getTransitInfo();
      return true;
    } else {
      return false;
    }
  }
}

Map<String, dynamic> colorList = {
  'badge-blue': const Color.fromARGB(255, 54, 64, 142),
  'badge-blue2': const Color.fromARGB(255, 103, 74, 154),
  'badge-light-blue4': const Color.fromARGB(255, 138, 132, 148),
  'badge-light-blue': const Color.fromARGB(255, 138, 132, 148),
  'badge-light-blue2': const Color.fromARGB(255, 138, 132, 148),
  'badge-light-blue3': const Color.fromARGB(255, 138, 132, 148),
  'badge-dark': const Color.fromARGB(255, 138, 132, 148),
};

Map<int, Color> StatusColor = {
  0: Color.fromARGB(255, 255, 82, 102),
  1: Color.fromARGB(255, 245, 202, 10),
  2: Color.fromARGB(255, 0, 199, 211),
  3: Color.fromARGB(255, 103, 76, 248),
  4: Color.fromARGB(255, 0, 199, 211),
  5: Color.fromARGB(255, 0, 199, 211),
  6: Color.fromARGB(255, 25, 219, 146),
  7: Color.fromARGB(255, 0, 199, 211),
};
