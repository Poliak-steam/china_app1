import 'package:flutter/material.dart';
import 'package:china_app/vars/variables.dart';

var status = new ValueNotifier(0);

//БЛОК СЛАЙДЕРА
class OrderStatus extends StatefulWidget {
  //индекс статуса
  final int statusNum;
  const OrderStatus({Key? key, required this.statusNum}) : super(key: key);
  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        status.value = widget.statusNum;
      },
      child: Container(
        color: colorList[statuses[widget.statusNum]["color"]],
        padding: EdgeInsets.all(7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 90,
                  child: Column(
                    children: [
                      Text(
                        statuses[widget.statusNum]["name"],
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'Arial'),
                      ),
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image.network(statuses[num]['image']);
                    // NetworkImage(statuses[num]['image']
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 8,
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: 45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//БЛОК ЗАКАЗА
class StatusBlock extends StatefulWidget {
  @override
  State<StatusBlock> createState() => _StatusBlockState();
}

class _StatusBlockState extends State<StatusBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.white,
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ValueListenableBuilder<int>(
          valueListenable: status,
          builder: (context, status, child) {
            return createTransitTable(status);
          }),
    );
  }
}

//СОЗДАНИЕ ТАБЛИЦЫ ЗАКАЗОВ
Widget createTransitTable(int status) {
  final List<Widget> baggagesWidgets = [];
  final count = CargosList.length - 1;
  for (int i = 0; i < count; i++) {
    if (status == CargosList[i].statusInfo['status_id']) {
      baggagesWidgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 250,
            height: 100,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            foregroundDecoration: BoxDecoration(
              border: Border.all(color: colorList['badge-blue'], width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      CargosList[i].numberClient,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'TransNumber',
                      style: TextStyle(
                        color: colorList['bagde-blue2'],
                        fontSize: 18,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          (CargosList[i].statusInfo['date'] != null)
                              ? CargosList[i].statusInfo['date']
                              : 'no data',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          CargosList[i].weight.toStringAsFixed(2),
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Icon(
                Icons.add_a_photo,
                size: 80,
              ),
            ],
          )
        ],
      ));
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
              padding: const EdgeInsets.all(10), child: baggagesWidgets[index]);
        });
  }
}

//СОЗДАНИЕ ТАБЛИЦЫ ПОЛЬЗОВАТЕЛЕЙ
Widget createTable(int? unit) {
  List<TableRow> rows = [];
  if (unit == null) {
    rows.add(const TableRow(children: [
      Text(''),
      Text(''),
      Text(''),
      Text(''),
    ]));
  } else {
    for (int i = 0; i < cashDesks.data[unit].users_assigned.length; ++i) {
      rows.add(TableRow(children: [
        Text(cashDesks.data[unit].users_assigned[i].id.toString()),
        Text(cashDesks.data[unit].users_assigned[i].name),
        Text(cashDesks.data[unit].users_assigned[i].surname),
        Text(cashDesks.data[unit].currency_title),
      ]));
    }
  }
  return Table(
      children: rows, border: TableBorder.all(width: 1, color: Colors.black));
}

// ТАБЛИЦА ПОЛЬЗОВАТЕЛЕЙ
class UserTable extends StatefulWidget {
  const UserTable({super.key});

  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  int? unitNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          createTable(unitNum),
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
                                unitNum = 0;
                              });
                            },
                            child: Text('Казак')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitNum = 1;
                              });
                            },
                            child: Text('Потап')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitNum = 2;
                              });
                            },
                            child: Text('МСК офис')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitNum = 3;
                              });
                            },
                            child: Text('МСК склад')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitNum = 4;
                              });
                            },
                            child: Text('Владивосток')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitNum = 5;
                              });
                            },
                            child: Text('Хабаровск')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitNum = 6;
                              });
                            },
                            child: Text('Благовещенск')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitNum = 7;
                              });
                            },
                            child: Text('Дубай')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                unitNum = 8;
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
        ],
      ),
    );
  }
}

//СЛАЙДЕР
class MainSlider extends StatelessWidget {
  const MainSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
