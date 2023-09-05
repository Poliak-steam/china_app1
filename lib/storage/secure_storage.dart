import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
FlutterSecureStorage storage = const FlutterSecureStorage();

class SecureStorage {

  static Future setToken(String value) async {
    await storage.write(key: 'token', value: value);
  }

  static Future getToken() async {
    var res = await storage.read(key: 'token');
    return res;
  }

  static Future setBasicAuth(String usr, String psw) async {
    await storage.write(key: 'basicUsr', value: usr);
    await storage.write(key: 'basicPsw', value: psw);
  }

  static Future<String> getBasicAuth() async {
    final username = await storage.read(key: 'basicUsr');
    final password = await storage.read(key: 'basicPsw');

    String res = 'Basic ' + base64.encode(utf8.encode('$username:$password'));
    return res;
  }

}