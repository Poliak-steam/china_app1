import 'package:flutter/material.dart';
import 'package:china_app/generators/generate_widjet.dart';
import 'package:china_app/vars/variables.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
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

      //BODY
      body: Column(children: [

        //SLIDER
        const MainSlider(),

        //TRANS STATUSES
        StatusBlock(stream: orderNumStream.stream),

        //USERS TABLE
        UserTable(),

      ]),
    );
  }
}
