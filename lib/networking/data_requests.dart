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

Future<Map<String, dynamic>> getApi() async {
  String url = 'https://api.cash-test.odin.hl-group.ru/api/cash_desks';
  var temp = await http.get(Uri.parse(url));
  var temp1 = json.decode(temp.body);
  //print(response.data[0].users_assigned[1].name);
  return temp1;
}

CashDesks getDesksInfo (someMap) {

  CashDesks response = CashDesks.fromJson(someMap);

  return response;

}


class CashDesks {

  CashDesks({required this.headers, required this.data});
  final List<Data> data;
  final List<Headers> headers;

  factory CashDesks.fromJson(Map<String, dynamic> JsonMap) {
    // ! there's a problem with this code (see below)
    final headersData = JsonMap['headers'] as List<dynamic>?;
    final dataMap = JsonMap['data'] as List<dynamic>?;

    return CashDesks(
      data: dataMap != null
          ? dataMap.map((temMap) =>
          Data.fromJson(temMap as Map<String, dynamic>)).toList() : <Data>[],
      headers: headersData != null
          ? headersData.map((headerData) =>
          Headers.fromJson(headerData as Map<String, dynamic>)).toList() : <Headers>[],
    );

  }
  Map<String, dynamic> toJson() {
    return {
      'headers': headers.map((header) => header.toJson()).toList(),
    };
  }

}


class Headers {
  Headers({required this.name, required this.bundle, required this.accessor, required this.type});
  // non-nullable - assuming the score field is always present
  final String name;
  final String bundle;
  final String accessor;
  final String type;



  factory Headers.fromJson(Map<String, dynamic> data) {
    final name = (data['name'] != null) ? data['name'] as String : '';
    final bundle = (data['bundle'] != null) ? data['bundle'] as String : '';
    final accessor = (data['accessor'] != null) ? data['accessor'] as String : '';
    final type = (data['type'] != null) ? data['type'] as String : '';
    return Headers(name: name, bundle: bundle, accessor: accessor, type: type);



  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bundle': bundle,
      'accessor': accessor,
      'review': type,
    };
  }
}



class Data {
  Data({
    required this.id,
    required this.title,
    required this.currency_id,
    required this.currency_title,
    required this.currency_dop_title,
    required this.currency_symbol,
    required this.currency_dop_symbol,
    required this.currency_dop_id,
    required this.incoming_balance,
    required this.incoming_balance_dop,
    required this.allow_transfers,
    required this.is_main,
    required this.currency,
    required this.currency_dop,
    required this.users_assigned,
   // required this.cash_desks_moves,
  });
  // non-nullable - assuming the score field is always present


  final int id;
  final String title;
  final int currency_id;
  final String currency_title;
  final String currency_dop_title;
  final String currency_symbol;
  final String currency_dop_symbol;
  final int currency_dop_id;
  final int incoming_balance;
  final int incoming_balance_dop;
  final bool allow_transfers;
  final bool is_main;
  final List<Currency> currency;
  final String currency_dop;
  final List<UsersAssigned> users_assigned;
  //final String cash_desks_moves;



  factory Data.fromJson(Map<String, dynamic> data) {
    final id = (data['id'] != null) ? data['id'] as int : 0;
    final title = (data['title'] != null) ? data['title'] as String : '';
    final currency_id = (data['currency_id'] != null) ? data['currency_id'] as int : 0;
    final currency_title = (data['currency_title'] != null) ? data['currency_title'] as String : '';
    final currency_dop_title = (data['currency_dop_title'] != null) ? data['currency_dop_title'] as String : '';
    final currency_symbol = (data['currency_symbol'] != null) ? data['currency_symbol'] as String : '';
    final currency_dop_symbol = (data['currency_dop_symbol'] != null) ? data['currency_dop_symbol'] as String : '';
    final currency_dop_id = (data['currency_dop_id'] != null) ? data['currency_dop_id'] as int : 0;
    final incoming_balance = (data['incoming_balance'] != null) ? data['incoming_balance'] as int : 0;
    final incoming_balance_dop = (data['incoming_balance_dop'] != null) ? data['incoming_balance_dop'] as int : 0;
    final allow_transfers = (data['allow_transfers'] != null) ? data['allow_transfers'] as bool : false;
    final is_main = (data['is_main'] != null) ? data['is_main'] as bool : false;
    final currencyData = data['currencyData'] as List<dynamic>?;// pizda
    final currency_dop = (data['currency_dop'] != null) ? data['currency_dop'].toString() : '';
    final usersData =  data['users_assigned'] as List<dynamic>?;// pizda
   // final cash_desks_moves = data['cash_desks_moves'] as String;//pizda+-

    return Data(

        id: id,
        title: title,
        currency_id: currency_id,
        currency_title: currency_title,
        currency_dop_title: currency_dop_title,
        currency_symbol: currency_symbol,
        currency_dop_symbol: currency_dop_symbol,
        currency_dop_id: currency_dop_id,
        incoming_balance: incoming_balance,
        incoming_balance_dop: incoming_balance_dop,
        allow_transfers: allow_transfers,
        is_main: is_main,
      currency: currencyData != null
          ? currencyData.map((tempData) =>
          Currency.fromJson(tempData as Map<String, dynamic>)).toList() : <Currency>[],
        currency_dop: currency_dop,
        users_assigned: usersData != null
            ? usersData.map((tempData) =>
            UsersAssigned.fromJson(tempData as Map<String, dynamic>)).toList() : <UsersAssigned>[],
        //cash_desks_moves: cash_desks_moves,

    );



  }

  /*Map<String, dynamic> toJson() {
    return {

    };
  }*/
}

class Currency {
  Currency({required this.id, required this.title, required this.symbol});
  // non-nullable - assuming the score field is always present
  final int id;
  final String title;
  final String symbol;



  factory Currency.fromJson(Map<String, dynamic> data) {
    final id = (data['id'] != null) ? data['id'] as int : 0;
    final title = (data['title'] != null) ? data['title'] as String : '';
    final symbol = (data['symbol'] != null) ? data['symbol'] as String : '';
    return Currency(id: id, title: title, symbol: symbol);



  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'symbol': symbol,

    };
  }
}


class UsersAssigned {
  UsersAssigned({required this.id, required this.name, required this.surname});
  // non-nullable - assuming the score field is always present
  final int id;
  final String name;
  final String surname;



  factory UsersAssigned.fromJson(Map<String, dynamic> data) {
    final id = (data['id'] != null) ? data['id'] as int : 0;
    final name = (data['name'] != null) ? data['name'] as String : '';
    final surname = (data['surname'] != null) ? data['surname'] as String : '';
    return UsersAssigned(id: id, name: name, surname: surname);



  }

  Map<String, dynamic> toJson() {
    return {

    };
  }
}