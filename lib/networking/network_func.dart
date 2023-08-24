import 'dart:convert';
import 'dart:io';
import 'package:china_app/networking/request_vars.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;


Future<bool> isConnected() async {
  var currentConn = await Connectivity().checkConnectivity();
  if (currentConn == ConnectivityResult.wifi ||
      currentConn == ConnectivityResult.mobile) {
    return true;
  } else {
    return false;
  }
}

Future<bool> isApiConnected() async {
  try {
    var resp = await http.post(
      Uri.parse('http://master.crm.hl-group.ru/api'),
      headers: {
        'authorization':
            'Basic ${base64.encode(utf8.encode('admin:ugUYT76hjg'))}'
      },
      body: RequestVar.getTest(),
    );
    switch (resp.statusCode) {
      case 200:
      case 201:
        return true;

      default:
        return false;
    }
  } on SocketException {
    print(SocketException);
    return false;
  } on FormatException {
    print(FormatException);
    return false;
  } on HttpException {
    print(HttpException);
    return false;
  }
}

