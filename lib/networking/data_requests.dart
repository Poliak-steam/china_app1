import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:china_app/networking/request_vars.dart';

Future<Map> getData(user,psw,Map requestMap) async {
  String url = 'http://master.crm.hl-group.ru/api';
  String basicAuth = 'Basic ' + base64.encode(utf8.encode('$user:$psw'));
  Map map;

  var response = await http.post(
    Uri.parse(url),
    headers: {'authorization': basicAuth},
    body: requestMap,
  );

  if(response.body.contains('error_text')) {
    final Map token = await getData(user, psw, RequestVar.getTokenRequest());
    requestMap.remove('token');
    requestMap.addAll({'token': '${token["result"]}'} as Map<String,String>);
    map = await getData(user, psw, requestMap);
  } else {
  map = json.decode(response.body);}

  return map;
}



