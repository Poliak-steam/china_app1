import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import '../grants/grands_requests.dart';
import '../notifications/notify.dart';
import '../vars/variables.dart';

void load(context) async {

  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
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

  Permission.notification.request();
  Permission.manageExternalStorage.request();
  iosRequest();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  final fcmToken =
  await FirebaseMessaging.instance.getToken();
  print('$fcmToken');

  await StartVars.getVars();

  Navigator.pushReplacementNamed(context, '/MainScreen');

  }
