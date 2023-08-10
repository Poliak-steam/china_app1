import 'package:flutter/material.dart';
import 'package:china_app/generators/generate_widjet.dart';
import '../generators/pop_up.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchController = TextEditingController();
  String _searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 31, 83),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            ListTile(
              title: Text("Меню 1"),
              trailing: Icon(Icons.arrow_back),
            ),
            ListTile(
              title: Text("Меню 2"),
              trailing: Icon(Icons.arrow_downward),
            ),
          ],
        ),
      ),
      //APP BAR
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 31, 83),
        title: const Text('Статус заказа'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [showNotifyPop(context)],
            icon: const Image(image: AssetImage('assets/img/ring.png')),
            offset: const Offset(-20, 0),
            color: Colors.white,
            elevation: 2,
            position: PopupMenuPosition.under,
          ),
          PopupMenuButton(
            itemBuilder: (context) => [showFilterPop(context)],
            icon: const Image(image: AssetImage('assets/img/sort.png')),
            offset: Offset(-20, 0),
            color: Colors.white,
            elevation: 2,
            position: PopupMenuPosition.under,
          ),
        ],
      ),

      //BODY
      body: Column(children: [
        //SLIDER
        const MainSlider(),

        // TRANS LIST
        Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 240, 244),
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      Align(
                        alignment: FractionalOffset.topCenter,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          height: 4,
                          width: 30,
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Поиск'),
                                maxLines: 1,
                                controller: searchController,
                                onChanged: (text) {
                                  setState(() {
                                    _searchText = searchController.text;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage('assets/img/search.png'),
                                )),
                          ],
                        ),
                      ),

                      //TRANS STATUSES
                      Expanded(
                        child: ValueListenableBuilder<int>(
                            valueListenable: status,
                            builder: (context, status, child) {
                              return createTransitTable(status, _searchText);
                            }),
                      )
                    ],
                  ),
                )))
      ]),
    );
  }
}
