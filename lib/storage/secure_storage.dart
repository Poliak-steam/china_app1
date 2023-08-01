import 'package:china_app/vars/variables.dart';

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