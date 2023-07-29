import 'package:china_app/vars/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:china_app/networking/data_requests.dart';
import 'package:china_app/generators/generate_widjet.dart';
import 'package:china_app/networking/request_vars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

import 'package:flutter/rendering.dart';

final _storage = FlutterSecureStorage();

Map temp = {};
Map token = {};
Map status = {};
int state_nums = 0;

List<Map> status1 = [];
List<Map> statuses = [];
List<Widget> orderStatuses = [];
Map<String, dynamic> tempMap = {};

void main() async {
  tempMap = await getApi();
  token = await getData('admin', 'ugUYT76hjg', RequestVar.getTokenRequest());

  await _storage.write(
    key: "token",
    value: "token",
  );

  temp = await getData(
      'admin', 'ugUYT76hjg', RequestVar.getStatusRequest(token["result"]));
  status1 = (temp["result"] as List).map((e) => e as Map).toList();
  for (var num = 0; num < status1.length; num++) {
    status1[num]['image'] =
        "http://master.crm.hl-group.ru" + status1[num]['svg'];
    statuses.add(status1[num]);
  }
  for (var num = 0; num < statuses.length; num++) {
    orderStatuses.add(OrderStatus(num: num));
  }

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
  int _unitNum = 0;
  @override
  Widget build(BuildContext context) {
    print(_storage.read(key: "token"));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(21, 37, 104, 1),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
        ),
        title: const Text('Статус заказа'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort_rounded)),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 150,
          child: Container(
            color: Colors.indigo,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: orderStatuses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: orderStatuses[index],
                  );
                }),
          ),
        ),
        StatusBlock(stream: controller.stream),
        Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: createTable(_unitNum),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 0;
                            });
                          },
                          child: Text('Казак')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 1;
                            });
                          },
                          child: Text('Потап')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 2;
                            });
                          },
                          child: Text('МСК офис')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 3;
                            });
                          },
                          child: Text('МСК склад')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 4;
                            });
                          },
                          child: Text('Владивосток')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 5;
                            });
                          },
                          child: Text('Хабаровск')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 6;
                            });
                          },
                          child: Text('Благовещенск')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 7;
                            });
                          },
                          child: Text('Дубай')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _unitNum = 8;
                            });
                          },
                          child: Text('Главная касса')),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ]),

      //функция которая возвращает виджет для текущего статуса
      // GetCurrentStatus();
    );
  }
}
