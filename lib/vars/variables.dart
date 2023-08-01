import 'dart:async';
import 'package:china_app/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:china_app/networking/data_requests.dart';
import 'package:china_app/networking/request_vars.dart';
import 'package:china_app/generators/generate_widjet.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Map OrderInfoResp = {};
Map token = {};
List<Map> OrderInfoResult = [];
List<Map> statuses = [];
List<Widget> orderStatuses = [];
Map<String, dynamic> tempJsonMap = {};
StreamController<int> orderNumStream = StreamController<int>();
CashDesks cashDesks = getDesksInfo(tempJsonMap);
FlutterSecureStorage storage = FlutterSecureStorage();

class StartVars {

 static Future getVars () async {
   tempJsonMap = await getCashDesks();
   token = await postOrderInfo(
       'admin',
       'ugUYT76hjg',
       RequestVar.getTokenRequest()
   );
   await SecureStorage.setValue(token["result"]);
   OrderInfoResp = await postOrderInfo(
       'admin',
       'ugUYT76hjg',
       RequestVar.getStatusRequest( await SecureStorage.getValue('token'))
   );
   OrderInfoResult = (OrderInfoResp["result"] as List).map((e) => e as Map).toList();
   for (var num = 0; num < OrderInfoResult.length; num++) {
     OrderInfoResult[num]['image'] =
         "http://master.crm.hl-group.ru" + OrderInfoResult[num]['svg'];
     statuses.add(OrderInfoResult[num]);
   }
   for (var num = 0; num < statuses.length; num++) {
     orderStatuses.add(OrderStatus(num: num));
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
