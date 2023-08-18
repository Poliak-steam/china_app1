import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:china_app/vars/variables.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

var status = ValueNotifier(-1);

// СОЗДАНИЕ СПИСКА ЗАКАЗОВ
void addBaggages(List<Widget> List, int i, context) {
  List.add(
    InkWell(
      onTap: () {
        showTransModal(CargosList[i].id, i, context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                      color: StatusColor[CargosList[i].statusInfo['status_id']],
                    ),
                    const Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      CargosList[i].statusInfo['status'],
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Text(
                  CargosList[i].numberClient,
                  style: const TextStyle(
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
                  style: const TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.airplanemode_active,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      CargosList[i].destination,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

//СОЗДАНИЕ ТАБЛИЦЫ ЗАКАЗОВ
Widget createTransitTable(int status, String searchText, context) {
  List<Widget> baggagesWidgets = [];
  final count = CargosList.length - 1;
  if (searchText != '') {
    for (int i = 0; i < count; i++) {
      if (CargosList[i].numberClient.startsWith(searchText)) {
        addBaggages(baggagesWidgets, i, context);
      }
    }
  } else {
    for (int i = 0; i < count; i++) {
      if (status == -1) {
        addBaggages(baggagesWidgets, i, context);
      } else if (status == CargosList[i].statusInfo['status_id']) {
        addBaggages(baggagesWidgets, i, context);
      }
    }
  }

  if (baggagesWidgets.isEmpty) {
    return Container(
      child: const Center(
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
    statusesList.add(GestureDetector(
      onTap: () {
        status.value = i;
      },
      child: Container(
        decoration: BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
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
                    color: StatusColor[i],
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

void showTransModal(String id, int i, context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          color: const Color.fromARGB(255, 22, 36, 104),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 23, 38, 115))),
                        child: const Image(
                            image: AssetImage('assets/img/back_arrow.png')),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Артикул',
                          style: TextStyle(
                            color: Color.fromARGB(255, 82, 114, 251),
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          CargosList[i].numberClient,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Color.fromARGB(255, 238, 240, 244),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            'Текущий статус',
                            style: TextStyle(
                                color: Color.fromARGB(255, 21, 35, 99),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(13),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            'assets/img/status.png')),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        '${CargosList[i].statusInfo['status']}'
                                            .toCapitalized(),
                                        style: const TextStyle(
                                          height: 1,
                                          color: Color.fromARGB(
                                            255,
                                            22,
                                            36,
                                            104,
                                          ),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 10)),
                                Icon(
                                  Icons.circle,
                                  color: StatusColor[
                                      CargosList[i].statusInfo['status_id']],
                                  size: 8,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${CargosList[i].statusInfo['date']}'
                                      .substring(
                                          0,
                                          CargosList[i]
                                              .statusInfo['date']
                                              .indexOf(' ')),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.airplanemode_active,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 10)),
                                Text(
                                  CargosList[i].destination,
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Text(
                              CargosList[i].batch as String,
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Expanded(
                        child: OverflowBox(
                          maxWidth: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(33),
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Количество мест',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            '${CargosList[i].fullInfo['count_places']}',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 21, 35, 99),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      const DottedLine(
                                        dashColor: Colors.grey,
                                        dashLength: 2,
                                        dashRadius: 1,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      //second
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Вес',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            '${CargosList[i].weight.toStringAsFixed(2)} кг',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 21, 35, 99),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      const DottedLine(
                                        dashColor: Colors.grey,
                                        dashLength: 2,
                                        dashRadius: 1,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      //third
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Объем',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            '${CargosList[i].fullInfo['volume']} м\xB3',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 21, 35, 99),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      const DottedLine(
                                        dashColor: Colors.grey,
                                        dashLength: 2,
                                        dashRadius: 1,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      //fourth
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Плотность',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            '${CargosList[i].fullInfo['density']} кг/\xB3',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 21, 35, 99),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      const DottedLine(
                                        dashColor: Colors.grey,
                                        dashLength: 2,
                                        dashRadius: 1,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      //fifth
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Курс',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            '92 \u20BD',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 21, 35, 99),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      const DottedLine(
                                        dashColor: Colors.grey,
                                        dashLength: 2,
                                        dashRadius: 1,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      //sixth
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Доп. расходы',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            '${CargosList[i].dopSum} \u20BD',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 21, 35, 99),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                      const DottedLine(
                                        dashColor: Colors.grey,
                                        dashLength: 2,
                                        dashRadius: 1,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 13)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) =>
                                                        const Color.fromARGB(
                                                            255, 21, 35, 99)),
                                            minimumSize: MaterialStateProperty
                                                .resolveWith(
                                                    (states) => Size(130, 50)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            )),
                                          ),
                                          onPressed: () {
                                            showDocsModal(id, i, context);
                                          },
                                          child: Text('Документы')),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 15)),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) =>
                                                        const Color.fromARGB(
                                                            255, 81, 114, 251)),
                                            minimumSize: MaterialStateProperty
                                                .resolveWith(
                                                    (states) => Size(130, 50)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            )),
                                          ),
                                          onPressed: () {},
                                          child: const Text('Расчетки')),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }));
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Center(
              child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 22, 36, 104)),
                  accountName: Text('Name Surname'),
                  accountEmail: Text("NameSurname@highway.group"),
                  currentAccountPicture:
                      Image(image: AssetImage('assets/img/account.png'))),
            ),
          ),
          ListTile(
              title: const Text("Заказы"),
              leading: const Icon(
                Icons.widgets,
                color: Color.fromARGB(255, 22, 36, 104),
              ),
              onTap: () {}),
          ListTile(
              title: const Text("Выйти"),
              leading: const Icon(Icons.logout,
                  color: Color.fromARGB(255, 22, 36, 104)),
              onTap: () {}),
        ],
      ),
    );
  }
}

void showNotify(context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          color: const Color.fromARGB(255, 22, 36, 104),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 23, 38, 115))),
                        child: const Image(
                            image: AssetImage('assets/img/back_arrow.png')),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    const Text(
                      'Уведомления',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Color.fromARGB(255, 238, 240, 244),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [Container()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }));
}

void showDocsModal(String id, int i, context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          color: const Color.fromARGB(255, 22, 36, 104),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 23, 38, 115))),
                        child: const Image(
                            image: AssetImage('assets/img/back_arrow.png')),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Артикул',
                          style: TextStyle(
                            color: Color.fromARGB(255, 82, 114, 251),
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          CargosList[i].numberClient,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Color.fromARGB(255, 238, 240, 244),
                  ),
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image(image: AssetImage('assets/img/docs.png')),
                          Padding(padding: EdgeInsets.only(right: 15)),
                          Expanded(
                            child: Text(
                              CargosList[i].docs['name'],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 21, 35, 99)),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 6)),
                      const DottedLine(
                        dashColor: Colors.grey,
                        dashLength: 2,
                        dashRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }));
}
