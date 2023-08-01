import 'dart:ui';

import 'package:china_app/vars/variables.dart';
import 'package:flutter/material.dart';
import 'Screens/MainScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await StartVars.getVars();
  runApp(MaterialApp(
    /* theme: ThemeData(
      primaryColor: Colors.indigoAccent
  ),*/
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
    },
  ));
}


