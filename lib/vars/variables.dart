import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hl_flutter_app/networking/network_func.dart';
import 'package:hl_flutter_app/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:hl_flutter_app/networking/data_requests.dart';
import 'package:hl_flutter_app/networking/request_vars.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../Collections/transit_col.dart';
import '../networking/parsing.dart';
import '../notifications/notify.dart';

Map orderInfoResp = {};
List<Map> OrderInfoResult = [];
Map CargosResp = {};
Map<String, dynamic> CargosMap = {};
List<Transit> transitsList = [];
late Isar isar;
List<Map<String, dynamic>> transits = [];
late LocalNotificationService service;

class StartVars {
  static Future getVars() async {
    //ОТКРЫТИЕ ЛОКАЛЬНОЙ БАЗЫ
    final dbDir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [TransitSchema, DocsSchema, StatusInfoSchema],
      directory: dbDir.path,
    );
    // ЗАПИСЬ В ХРАНИЛИЩЕ
    final token = await postApi(RequestVar.getTokenRequest());
    await SecureStorage.setToken(token['result']);
    await SecureStorage.setBasicAuth('admin', 'ugUYT76hjg');
    //ПОЛУЧЕНИЕ СТАТУСОВ
    orderInfoResp = await postApi(await RequestVar.getStatusRequest());
    OrderInfoResult =
        (orderInfoResp["result"] as List).map((e) => e as Map).toList();

    //ПОЛУЧЕНИЕ ГРУЗОВ
    CargosResp = await postApi(await RequestVar.getCargosListRequest());
    CargosMap = CargosResp['result']['baggages'];

    for (int i = 0; i < CargosMap.length; i++) {
      if (!CargosMap.keys.elementAt(i).contains('c')) {
        transits.add(CargosMap.values.elementAt(i) as Map<String, dynamic>);
      } else {
        continue;
      }
    }

    //ИНИЦИАЛИЗАЦИЯ ЛОКАЛЬНЫХ УВЕДОМЛЕНИЙ
    service = LocalNotificationService();
    service.initialize();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      service.showNotification(
          id: 1,
          title: message.notification?.title ?? 'notify have no body',
          body: message.notification?.body ?? 'notify have no body');
    });

    getTransitInfo();
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
