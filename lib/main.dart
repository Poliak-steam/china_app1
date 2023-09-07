import 'dart:ui';
import 'package:flutter/material.dart';
import 'Screens/MainScreen.dart';
import 'Screens/authentif.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Authentification(),
      '/MainScreen': (context) => MainScreen(),
    },
  ));
}


