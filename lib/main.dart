import 'dart:ui';
import 'package:flutter/material.dart';
import 'Screens/MainScreen.dart';
import 'Screens/authentif.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Authentification(),
      '/MainScreen': (context) => MainScreen(),
    },
  ));
}


