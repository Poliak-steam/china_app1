import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hl_flutter_app/Collections/creditial_col.dart';
import 'package:hl_flutter_app/networking/data_requests.dart';
import 'package:hl_flutter_app/networking/request_vars.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Collections/status_col.dart';
import '../Collections/transit_col.dart';
import '../firebase_options.dart';
import '../grants/grands_requests.dart';
import '../networking/network_func.dart';
import '../notifications/notify.dart';
import '../vars/variables.dart';

load(context, Map result) async {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('loading...'),
            Icon(Icons.accessible_forward),
          ],
        ),
      ),
    );
  }));






  //Инициализация глобальных переменных и пользовательских данных
  await StartVars.getVars(result);



  //Печать токена fcm
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('$fcmToken');


//отправка fcm токена на сервер
  await postApi(await RequestVar.insertAppClientFcmToken(fcmToken, (await isar.creditials.where().findFirst())?.id));



  //Переход на главную страницу
  Navigator.pushReplacementNamed(context, '/MainScreen');
}
