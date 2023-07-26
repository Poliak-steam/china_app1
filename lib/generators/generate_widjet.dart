import 'dart:async';

import 'package:flutter/material.dart';
import 'package:china_app/main.dart';
import 'package:china_app/vars/variables.dart';
import 'package:carousel_slider/carousel_slider.dart';

StreamController<int> controller = StreamController<int>();

class OrderStatus extends StatefulWidget {
  final int num;
  const OrderStatus({Key? key, required this.num}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'Arial'),
                      ),
                    ],
                  ),
                ),
                Column(
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

class StatusBlock extends StatefulWidget {
  final Stream<int> stream;

  const StatusBlock({Key? key, required this.stream}) : super(key: key);

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
    return Container(
      height: 100,
      width: 400,
      margin: EdgeInsets.only(top: 20),
      color: Colors.white,
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 250,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            statuses[value]["name"],
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Number of order',
                            style: TextStyle(
                              color: colorList['bagde-blue2'],
                              fontSize: 18,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'data: 01.01.2001',
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
                                'Weight info',
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
          )
        ],
      ),
    );
  }
}
