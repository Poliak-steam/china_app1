import 'dart:math';
import 'package:flutter/material.dart';
import 'package:china_app/vars/variables.dart';

var status = ValueNotifier(-1);

// СОЗДАНИЕ СПИСКА ЗАКАЗОВ
void addBaggages(List<Widget> List, int i) {
  List.add(
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  Padding(padding: EdgeInsets.only(right: 5)),
                  Text(
                    CargosList[i].statusInfo['status'],
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Text(
                CargosList[i].numberClient,
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 23, 38, 115)),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                CargosList[i].batch as String,
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  Icon(
                    Icons.airplanemode_active,
                    size: 20,
                    color: Colors.grey,
                  ),
                  Padding(padding: EdgeInsets.only(right: 5)),
                  Text(
                    CargosList[i].destination,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

//СОЗДАНИЕ ТАБЛИЦЫ ЗАКАЗОВ
Widget createTransitTable(int status, String searchText) {
  List<Widget> baggagesWidgets = [];
  final count = CargosList.length - 1;
  if (searchText != '') {
    for (int i = 0; i < count; i++) {
      if (CargosList[i].numberClient.startsWith(searchText)) {
        addBaggages(baggagesWidgets, i);
      }
    }
  } else {
    for (int i = 0; i < count; i++) {
      if (status == -1) {
        addBaggages(baggagesWidgets, i);
      } else if (status == CargosList[i].statusInfo['status_id']) {
        addBaggages(baggagesWidgets, i);
      }
    }
  }

  if (baggagesWidgets.isEmpty) {
    return Container(
      child: Center(
        child: Text('there isnt any baggages'),
      ),
    );
  } else {
    return ListView.builder(
        itemCount: baggagesWidgets.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: baggagesWidgets[index]);
        });
  }
}

// СОЗДАНИЕ БЛОКОВ СЛАЙДЕРА
Widget createSlider(whoActive) {
  final List<Widget> statusesList = [];
  final count = OrderInfoResult.length - 1;
  Color activeColor = const Color.fromARGB(255, 23, 38, 115);

  for (int i = 0; i < count; i++) {
    if (whoActive == i) {
      activeColor = const Color.fromARGB(255, 34, 53, 147);
    } else {
      activeColor = const Color.fromARGB(255, 23, 38, 115);
    }
    if (OrderInfoResult[i]['name'] != OrderInfoResult[i + 1]['name']) {
      statusesList.add(GestureDetector(
        onTap: () {
          status.value = i;
        },
        child: Container(
          decoration: BoxDecoration(
            color: activeColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(10),
          width: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(
                      OrderInfoResult[i]["name"],
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'Arial'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 8,
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Image.network(OrderInfoResult[i]['icon']),
                  Image(image: AssetImage('assets/img/status.png')),
                ],
              ),
            ],
          ),
        ),
      ));
    }
  }

  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: statusesList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: statusesList[index],
        );
      });
}

//СЛАЙДЕР
class MainSlider extends StatelessWidget {
  const MainSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Container(
          child: ValueListenableBuilder<int?>(
              valueListenable: status,
              builder: (context, status, child) {
                return createSlider(status);
              }),
        ));
  }
}


