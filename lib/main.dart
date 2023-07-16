import 'package:flutter/material.dart';
import 'package:china_app/networking/data_requests.dart';
import 'package:china_app/generators/generate_widjet.dart';
import 'package:china_app/networking/request_vars.dart';
Map temp = {};
Map token = {};
Map status = {};

List<Map> status1 = [];

void main() async {
  token = await getData('admin','ugUYT76hjg',RequestVar.getTokenRequest());
  temp = await getData('admin','ugUYT76hjg',RequestVar.getStatusRequest(token["result"]));
  status1 = (temp["result"] as List).map((e) => e as Map).toList();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(21, 37, 104, 1),
        leading: IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.menu_rounded),
        ),

        title:  const Text('Статус заказа'),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.notifications)
          ),
          IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.sort_rounded)
          ),
        ],

      ),
      body: Container(
        color: const Color.fromRGBO(21, 37, 104, 1),
        height: 150,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
        child:  const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OrderStatus(num: 0),
            OrderStatus(num: 1),
          ],
        ),
      ),
          //функция которая возвращает виджет для текущего статуса
          //GetCurrentStatus();

      );

  }
}
