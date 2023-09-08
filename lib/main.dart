import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hl_flutter_app/vars/variables.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'Collections/creditial_col.dart';
import 'Collections/status_col.dart';
import 'Collections/transit_col.dart';
import 'Screens/MainScreen.dart';
import 'Screens/authentif.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  //Инициализация FireBase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//ОТКРЫТИЕ ЛОКАЛЬНОЙ БАЗЫ
  isar = await Isar.open(
    [
      TransitSchema,
      DocsSchema,
      StatusInfoSchema,
      StatusSchema,
      CreditialSchema
    ],
    directory: Platform.isAndroid
        ? (await getApplicationDocumentsDirectory()).path
        : (await getLibraryDirectory()).path,
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


