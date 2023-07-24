import 'dart:async';

import 'package:flutter/material.dart';
import 'package:china_app/main.dart';
import 'package:china_app/vars/variables.dart';
import 'package:carousel_slider/carousel_slider.dart';

StreamController<int> controller = StreamController<int>();

class OrderStatus extends StatefulWidget {
  final int num;
  const OrderStatus({ Key? key, required this.num }): super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
      onTap: (){
        setState(() {
          state_nums = widget.num;
          controller.add(state_nums);
        });

      },
      child: Container(
        // const Color.fromRGBO(34, 53, 147, 0.6)
        color: colorList[statuses[widget.num]["color"]],
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
                        statuses[widget.num]["name"],
                        style:  const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial'
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image.network(statuses[num]['image']);
                    // NetworkImage(statuses[num]['image']
                    Icon(Icons.circle, color: Colors.green, size: 8,),
                  ],
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.home_filled, color: Colors.white, size: 45,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class StatusBlock extends StatefulWidget {

  final Stream<int> stream;

  const StatusBlock({ Key? key, required this.stream }): super(key: key);


  @override
  State<StatusBlock> createState() => _StatusBlockState();
}

class _StatusBlockState extends State<StatusBlock> {

  int value = 0;

  void _updateSeconds(int newValue) {
    setState(() {
      value = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.stream.listen((seconds) {
      _updateSeconds(seconds);
    });
  }

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 100,
      child: Container(
        color: Colors.grey,
        child: ListView(
          children: [
            Text(statuses[value]["name"]),
          ],
        ),
      ),
    );
  }
}








