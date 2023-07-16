import 'package:flutter/material.dart';
import 'package:china_app/main.dart';

class OrderStatus extends StatelessWidget {
  final int num;
  const OrderStatus({ Key? key, required this.num }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: const Color.fromRGBO(34, 53, 147, 0.6),
      width: 150,
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
                      status1[num]["name"],
                      style:  const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial'
                      ),
                    ),
                  ],
                ),
              ),
             const Column(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
    );
  }

}