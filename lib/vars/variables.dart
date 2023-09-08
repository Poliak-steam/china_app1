import 'dart:async';
import 'package:hl_flutter_app/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:hl_flutter_app/networking/data_requests.dart';
import 'package:hl_flutter_app/networking/request_vars.dart';
import 'package:isar/isar.dart';
import '../Collections/status_col.dart';
import '../Collections/transit_col.dart';
import '../networking/parsing.dart';
import '../notifications/notify.dart';

List<Status> statusesList = [];

List<Map<String, dynamic>> statuses = [];
List<Transit> transitsList = [];
late Isar isar;
LocalNotificationService service = LocalNotificationService();

class StartVars {
  static Future<void> getVars(Map result) async {
    // ЗАПИСЬ В ХРАНИЛИЩЕ
    final token = await postApi(RequestVar.getTokenRequest());
    await SecureStorage.setToken(token['result']);
    await SecureStorage.setBasicAuth('admin', 'ugUYT76hjg');

    //ПОЛУЧЕНИЕ ГРУЗОВ

    final Map<String, dynamic> transits =
        (await postApi(await RequestVar.getCargosListRequest()))['result']
            ['baggages'] as Map<String, dynamic>;

    //Удаление грузов у которых нет statusInfo
    for (int i = 0; i < transits.length; i++) {
      transits.removeWhere((key, value) => key.startsWith('c'));
    }
    //Заполнение списка грузов из локальной базы
    transitsList = await getTransitInfo(transits);
    //ПОЛУЧЕНИЕ СТАТУСОВ
    statuses =
        ((await postApi(await RequestVar.getStatusRequest()))['result'] as List)
            .map((e) => e as Map<String, dynamic>)
            .toList();
    statusesList = await getStatusInfo();
print(result);
    await setUserData(result);

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
