import 'dart:async';
import 'package:china_app/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:china_app/networking/data_requests.dart';
import 'package:china_app/networking/request_vars.dart';


Map token = {};
Map OrderInfoResp = {};
List<Map> OrderInfoResult = [];
Map CargosResp = {};
Map<String, dynamic> CargosMap = {};
List<Transits> CargosList = [];

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

    CargosResp = await postOrderInfo('admin', 'ugUYT76hjg',
        RequestVar.getCargosListRequest(await SecureStorage.getValue('token')));
    CargosMap = CargosResp['result']['baggages'];

    for (var j in CargosMap.values) {
      CargosList.add(getTransInfo(j as Map<String, dynamic>));
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
