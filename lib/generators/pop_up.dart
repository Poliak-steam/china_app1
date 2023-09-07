import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:hl_flutter_app/functions/string_functions.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import '../functions/Downloader.dart';
import '../vars/variables.dart';
import 'package:path_provider/path_provider.dart';

void showTransModal(int i, context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Image(
            image: AssetImage('assets/img/back_arrow.png'),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 36, 104),
        title: Column(
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
              transitsList[i].numberClient,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: const Color.fromARGB(255, 22, 36, 104),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
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
                                      image:
                                          AssetImage('assets/img/status.png')),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      '${transitsList[i].statusInfo.value!.statusName}'
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
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Icon(
                                Icons.circle,
                                color: StatusColor[
                                    transitsList[i].statusInfo.value!.id],
                                size: 8,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${transitsList[i].statusInfo.value!.statusDate}'
                                    .substring(
                                        0,
                                        transitsList[i]
                                            .statusInfo
                                            .value!
                                            .statusDate
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
                      padding: const EdgeInsets.all(13),
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
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Text(
                                transitsList[i].destination,
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Text(
                            transitsList[i].batch,
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(33),
                        child: SingleChildScrollView(
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '${transitsList[i].countPlaces}',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 35, 99),
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '${transitsList[i].weight.toStringAsFixed(2)} кг',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 35, 99),
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '${transitsList[i].volume} м\xB3',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 35, 99),
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '${transitsList[i].density} кг/м\xB3',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 35, 99),
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '92 \u20BD',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 35, 99),
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '${transitsList[i].dopSum} \u20BD',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 35, 99),
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
                                        minimumSize:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    const Size(130, 50)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        )),
                                      ),
                                      onPressed: () {
                                        showDocsModal(i, context);
                                      },
                                      child: const Text('Документы')),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 15)),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) =>
                                                    const Color.fromARGB(
                                                        255, 81, 114, 251)),
                                        minimumSize:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    const Size(130, 50)),
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }));
}

void showNotify(context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Image(
            image: AssetImage('assets/img/back_arrow.png'),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 36, 104),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Уведомления',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showNotify(context);
            },
            icon: const Image(image: AssetImage('assets/img/ring.png')),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: const Color.fromARGB(255, 22, 36, 104),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
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
    );
  }));
}

void showDocsModal(int i, context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Image(
            image: AssetImage('assets/img/back_arrow.png'),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 36, 104),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Документы',
              style: TextStyle(
                color: Color.fromARGB(255, 82, 114, 251),
                fontSize: 11,
              ),
            ),
            Text(
              transitsList[i].numberClient,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: const Color.fromARGB(255, 22, 36, 104),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Color.fromARGB(255, 238, 240, 244),
                ),
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final filePath =
                            '${(await getApplicationSupportDirectory()).path}/3497.pdf';
                        if (await File(filePath).exists()) {
                          FileDownloader().openFile(filePath: filePath);
                        } else {
                          await downloadFile();
                        }
                      },
                      child: Container(
                        height: 45,
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/img/docs.png'),
                              fit: BoxFit.fill,
                              height: 32,
                              width: 26,
                            ),
                            const Padding(padding: EdgeInsets.only(right: 15)),
                            Expanded(
                              child: Text(
                                transitsList[i].docs.value!.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 21, 35, 99)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 6)),
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
    );
  }));
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 22, 36, 104),
            ),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Center(
              child: UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 22, 36, 104)),
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
