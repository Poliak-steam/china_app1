import 'package:hl_flutter_app/networking/parsing.dart';
import 'package:hl_flutter_app/storage/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hl_flutter_app/networking/request_vars.dart';
import 'network_func.dart';

Future<Map> postOrderInfo(user, psw, Map requestMap) async {
  if (await isConnected()) {
    try {
      String url = 'http://master.crm.hl-group.ru/api';
      String basicAuth = 'Basic ${base64.encode(utf8.encode('$user:$psw'))}';
      Map map;

      var response = await http.post(
        Uri.parse(url),
        headers: {'authorization': basicAuth},
        body: requestMap,
      );
      map = json.decode(response.body);
      print('send post request "postOrderInfo"');
      if (response.body[0] ==
          'Неверный ключ или он уже истек. Получите новый ключ.') {
        try {
          final Map token =
              await postOrderInfo(user, psw, RequestVar.getTokenRequest());
          await SecureStorage.setValue(token['result']);
          requestMap.remove('token');
          requestMap
              .addAll({'token': '${await SecureStorage.getValue('token')}'});
          map = await postOrderInfo(user, psw, requestMap);
          print('token was refreshed and resend post request "postOrderInfo"');
        } catch (er) {
          print('token wasn\'t refreshed. Error: $er');
          map = {'error': 'tokenrefresh'};
        }
        return map;
      } else {
        return map;
      }
    } catch (er) {
      print('something went wrong: $er');
      return {'error': '$er'};
    }
  } else {
    print('server lost connection');
    return {'error': 'serverconn'};
  }
}

// Обработка Json для Грузов
Transits getTransInfo(TransMap) {
  Transits response = Transits.fromJson(TransMap);
  return response;
}
