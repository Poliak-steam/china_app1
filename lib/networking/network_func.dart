import 'dart:convert';
import 'dart:io';
import 'package:hl_flutter_app/networking/request_vars.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hl_flutter_app/storage/secure_storage.dart';
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
  var resp = await http.post(
    Uri.parse('http://master.crm.hl-group.ru/api'),
    headers: {
  'authorization': await SecureStorage.getBasicAuth()
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
}
