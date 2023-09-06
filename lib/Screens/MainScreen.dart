import 'package:flutter/material.dart';
import 'package:hl_flutter_app/generators/generate_widjet.dart';
import '../generators/pop_up.dart';
import 'package:hl_flutter_app/vars/variables.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchController = TextEditingController();
  String _searchText = '';
  bool isConn = true;

_checkConn() async {
    final ckeckConn = await StartVars.updateLocalDB();
    setState(() {
      isConn = ckeckConn;
    });
  }

  @override
  void initState() {
  //  _checkConn();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 31, 83),
      //SLIDER MENU
      drawer: const Menu(),
      //APP BAR
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 34, 100),
        title: const Text('Статус заказа'),
        actions: [
          IconButton(
            onPressed: () async {
              showNotify(context);
            },
            icon: const Image(image: AssetImage('assets/img/sort.png')),
          ),
          IconButton(
            onPressed: () {
              showNotify(context);
            },
            icon: const Image(image: AssetImage('assets/img/ring.png')),
          ),
        ],
      ),

      //BODY
      body: Column(children: [
        //STATUS SLIDER
        const MainSlider(),

        // TRANS LIST
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 240, 244),
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              //top line
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
                height: 4,
                width: 30,
              ),

              //search
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Поиск'),
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

              //TRANS LIST
              Expanded(
                child: ValueListenableBuilder<int>(
                    valueListenable: statusIndex,
                    builder: (context, statusIndex, child) {
                      return createTransitTable(
                          statusIndex, _searchText, context);
                    }),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
