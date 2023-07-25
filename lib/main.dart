import 'package:china_app/vars/variables.dart';
import 'package:flutter/material.dart';
import 'package:china_app/networking/data_requests.dart';
import 'package:china_app/generators/generate_widjet.dart';
import 'package:china_app/networking/request_vars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

Map temp = {};
Map token = {};
Map status = {};
int state_nums = 0;


List<Map> status1 = [];
List<Map> statuses = [];
List<Widget> orderStatuses = [];
Map<String,dynamic> tempMap = {};



void main() async {
  tempMap = await getApi();
  token = await getData('admin','ugUYT76hjg',RequestVar.getTokenRequest());
  temp = await getData('admin','ugUYT76hjg',RequestVar.getStatusRequest(token["result"]));
  status1 = (temp["result"] as List).map((e) => e as Map).toList();
  for(var num = 0; num < status1.length; num++)
  {
    status1[num]['image'] = "http://master.crm.hl-group.ru" + status1[num]['svg'];
    statuses.add(status1[num]);
  }
  for(var num = 0; num < statuses.length; num++) {
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
    CashDesks cashDesks = getDesksInfo(tempMap);


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
      body: Column(
        children: [

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
                    }
                ),
            ),
              ),

          StatusBlock(stream: controller.stream),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Table(

              children:  [
                TableRow(children: [Text('name'), Text('surname')]),
                TableRow(children: [
                  Text(cashDesks.data[_unitNum].users_assigned[0].name),
                  Text(cashDesks.data[_unitNum].users_assigned[0].surname),
                ]),
                TableRow(children: [
                  Text(cashDesks.data[_unitNum].users_assigned[1].name),
                  Text(cashDesks.data[_unitNum].users_assigned[1].surname),
                ]),
              ],
              border: TableBorder.all(width: 1, color: Colors.purple),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _unitNum = 2;
                    });
                  }
              ),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _unitNum = 4;
                    });
                  }
              ),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _unitNum = 0;
                    });
                  }
              ),
            ],
          )



        ]


      ),

          //функция которая возвращает виджет для текущего статуса
          //GetCurrentStatus();

      );

  }
}
