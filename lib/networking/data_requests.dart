import 'package:china_app/storage/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:china_app/networking/request_vars.dart';

Future<Map> postOrderInfo(user, psw, Map requestMap) async {
  String url = 'http://master.crm.hl-group.ru/api';
  String basicAuth = 'Basic ' + base64.encode(utf8.encode('$user:$psw'));
  Map map;

  var response = await http.post(
    Uri.parse(url),
    headers: {'authorization': basicAuth},
    body: requestMap,
  );
  print('send post request "postOrderInfo"');
  if (response.body[0] ==
      'Неверный ключ или он уже истек. Получите новый ключ.') {
    try {
      final Map token =
          await postOrderInfo(user, psw, RequestVar.getTokenRequest());
      await SecureStorage.setValue(token['result']);
      requestMap.remove('token');
      requestMap.addAll({'token': '${await SecureStorage.getValue('token')}'});
      map = await postOrderInfo(user, psw, requestMap);
      print('token was refreshed and resend post request "postOrderInfo"');
    } catch (er) {
      print('token wasn\'t refreshed. Error: $er');
      map = {'error': '1'};
    }
  } else if (response.body.contains('error_text')) {
    print('postOrderInfo can\'t be sand. Error: ${response.body[0]}');
    map = {'error': '1'};
  } else {
    map = json.decode(response.body);
  }

  return map;
}

// Обработка Json для Грузов
Transits getTransInfo(TransMap) {
  Transits response = Transits.fromJson(TransMap);
  return response;
}

// СТРУКТУРА ДЛЯ ГРУЗОВ
class Transits {
  Transits(
      {required this.batch,
        required this.destination,
      required this.numberClient,
      required this.statusInfo});
  final String? batch;
  final String destination;
  final String numberClient;
  final Map statusInfo;

  factory Transits.fromJson(Map<String, dynamic> JsonMap) {
    final batch = (JsonMap['batch'] != null)
        ? (JsonMap['batch']) as String
        : 'no batch';
    final destination = (JsonMap['destination'] != null)
        ? (JsonMap['destination']) as String
        : 'no destination';
    final numberClient = (JsonMap['number_client'] != null)
        ? (JsonMap['number_client']) as String
        : 'no number';
    final statusInfo = (JsonMap['status_info'] != null)
        ? (JsonMap['status_info']) as Map<String, dynamic>
        : {'status': 'nostatus'};

    return Transits(
      batch: batch,
      destination: destination,
      numberClient: numberClient,
      statusInfo: statusInfo,
    );
  }
}
