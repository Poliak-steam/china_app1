import 'package:hl_flutter_app/storage/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hl_flutter_app/networking/request_vars.dart';
import 'network_func.dart';

Future<Map> postApi(Map requestMap) async {
  String url = 'http://master.crm.hl-group.ru/api';
  Map map;
  final basicAuth = await SecureStorage.getBasicAuth();

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: {'authorization': 'Basic ' + base64.encode(utf8.encode('admin:ugUYT76hjg'))},
      body: requestMap,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (!response.body.contains('error_text')) {
        if (response.body.isNotEmpty) {
          return map = json.decode(response.body);
        } else {
          return {'error': 'empty'};
        }
      } else if (response.body[0].contains('Неверный ключ')) {
        await SecureStorage.setToken(
            (await postApi(RequestVar.getTokenRequest()))['result']);
        try {
          var response = await http.post(
            Uri.parse(url),
            headers: {'authorization': basicAuth},
            body: requestMap,
          );
          print(
              'token was refreshed and resend post(${requestMap['request']})');
          return map = json.decode(response.body);

        } catch (er) {
          print(
              'token was refreshed but resend post(${requestMap['request']}) end with error: $er');
          return {'error':'$er'};
        }
      } else {
        print(
            'post wasn\'t send from error: ${response.body.allMatches('error_text')}');
        return {'error':'response has error_text'};
      }
    } else {
      print('Post(${requestMap['request']}) return status code: ${response.statusCode}');
      return {'error':'${response.statusCode}'};
    }
  } catch (er) {
    print('post request(${requestMap['request']}) wasn\'t send. error: $er');
    return {'error':'$er'};
  }
}
