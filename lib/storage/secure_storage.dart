import 'package:flutter_secure_storage/flutter_secure_storage.dart';
FlutterSecureStorage storage = const FlutterSecureStorage();

class SecureStorage {

  static const _keValue = 'token';
  static Future setValue(String value) async {
    await storage.write(key: _keValue, value: value);
  }

  static Future getValue(String keyValue) async {
    var res = await storage.read(key: keyValue);
    return res;
  }

}