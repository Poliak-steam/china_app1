import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import '../grants/grands_requests.dart';
import '../networking/network_func.dart';
import '../notifications/notify.dart';
import '../vars/variables.dart';

load(context) async {
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

  await Permission.notification.request();
  await Permission.manageExternalStorage.request();
  await iosRequest();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('$fcmToken');

  await StartVars.getVars((await isConnected() || await isApiConnected()));

  Navigator.pushReplacementNamed(context, '/MainScreen');


}
