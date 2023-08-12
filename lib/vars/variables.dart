import 'dart:async';
import 'package:china_app/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:china_app/networking/data_requests.dart';
import 'package:china_app/networking/request_vars.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Map OrderInfoResp = {};
Map token = {};
List<Map> OrderInfoResult = [];
Map<String, dynamic> CargosMap = {};
List<Transits> CargosList = [];
List<Map> statuses = [];
List<Widget> orderStatuses = [];
Map<String, dynamic> tempJsonMap = {};
Map<String, dynamic> transJsonMap = {};
FlutterSecureStorage storage = const FlutterSecureStorage();
Map CargosTemp = {};
List<Widget> TransitList = [];

class StartVars {
  static Future getVars() async {
    token = await postOrderInfo(
        'admin', 'ugUYT76hjg', RequestVar.getTokenRequest());
    await SecureStorage.setValue(token["result"]);
    OrderInfoResp = await postOrderInfo('admin', 'ugUYT76hjg',
        RequestVar.getStatusRequest(await SecureStorage.getValue('token')));
    OrderInfoResult =
        (OrderInfoResp["result"] as List).map((e) => e as Map).toList();
    for (var num = 0; num < OrderInfoResult.length; num++) {
      OrderInfoResult[num]['icon'] =
          "http://master.crm.hl-group.ru${OrderInfoResult[num]['svg']}";
    }

    CargosTemp = await postOrderInfo('admin', 'ugUYT76hjg',
        RequestVar.getCargosListRequest(await SecureStorage.getValue('token')));
    CargosMap = CargosTemp['result']['baggages'];

    Map<String, dynamic> cargosListByStatuses = {
      "status_1": [],
      "status_2": [],
      "status_3": [],
      "status_4": [],
      "status_5": [],
      "status_6": [],
    };

    for (var cargosMapItem in CargosMap.values) {
      var mapKey = "status_${cargosMapItem['status_id'].toString()}";

      if (!cargosListByStatuses.containsKey(mapKey)) {
        continue;
      }

      // cargosListByStatuses[mapKey].add(getTransInfo(cargosMapItem as Map<String, dynamic>));
      cargosListByStatuses[mapKey].add(cargosMapItem as Map<String, dynamic>);
    }

    print(cargosListByStatuses["status_6"]);
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
