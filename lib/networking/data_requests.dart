import 'package:china_app/storage/secure_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:china_app/networking/request_vars.dart';

Future<Map> postOrderInfo(user, psw, Map requestMap) async {
  String url = 'http://master.crm.hl-group.ru/api';
  String basicAuth = 'Basic ${base64.encode(utf8.encode('$user:$psw'))}';
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
  Transits({
    required this.batch,
    required this.destination,
    required this.numberClient,
    required this.statusInfo,
    required this.id,
    required this.fullInfo,
    required this.weight,
    required this.dopSum,
  });
  final String id;
  final String? batch;
  final String destination;
  final String numberClient;
  final Map statusInfo;
  final FullInfo fullInfo;
  final double dopSum;
  final double weight;

  factory Transits.fromJson(Map<String, dynamic> JsonMap) {
    final batch =
        (JsonMap['batch'] != null) ? (JsonMap['batch']) as String : 'no batch';
    final destination = (JsonMap['destination'] != null)
        ? (JsonMap['destination']) as String
        : 'no destination';
    final numberClient = (JsonMap['number_client'] != null)
        ? (JsonMap['number_client']) as String
        : 'no number';
    final statusInfo = (JsonMap['status_info'] != null)
        ? (JsonMap['status_info']) as Map<String, dynamic>
        : {'status': 'nostatus'};
    final id = JsonMap['id'];
    final fullInfo = (JsonMap['full_info'] != null)
        ? (FullInfo.fromJson(JsonMap['full_info']))
        : FullInfo.fromJson({'info': 'noInfo'} as Map<String, dynamic>);
    final weight =
        (JsonMap['weight_b'] != null) ? (JsonMap['weight_b']) as double : 0.0;
    final dopSum =
        (JsonMap['dop_sum'] != null) ? (JsonMap['dop_sum']).toDouble() : 0.0;

    return Transits(
      weight: weight,
      fullInfo: fullInfo,
      dopSum: dopSum,
      id: id,
      batch: batch,
      destination: destination,
      numberClient: numberClient,
      statusInfo: statusInfo,
    );
  }
}

class FullInfo {
  FullInfo({
    required this.countPlaces,
    required this.volume,
    required this.density,
    required this.docs,
  });
  final int countPlaces;
  final String volume;
  final double density;
  final Map docs;

  factory FullInfo.fromJson(Map<String, dynamic> JsonMap) {
    final countPlaces = (JsonMap['count_places'] != null)
        ? (JsonMap['count_places']) as int
        : 0;
    final volume =
        (JsonMap['volume'] != null) ? (JsonMap['volume']) as String : '0.0';
    final density =
        (JsonMap['density'] != null) ? (JsonMap['density']) as double : 0.0;
    final docs = ((JsonMap['account_document'] != null) &&
            (JsonMap['account_document'] != ''))
        ? (JsonMap['account_document']) as Map<String, dynamic>
        : {'name': 'no file'};
    ;

    return FullInfo(
      docs: docs,
      countPlaces: countPlaces,
      volume: volume,
      density: density,
    );
  }
}

Future<bool> isConnected() async {
  var currentConn = await Connectivity().checkConnectivity();
  if (currentConn == ConnectivityResult.wifi ||
      currentConn == ConnectivityResult.mobile) {
    return true;
  } else {
    return false;
  }
}
