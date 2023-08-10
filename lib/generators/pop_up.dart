import 'package:flutter/material.dart';

PopupMenuItem showNotifyPop(context) {
  return PopupMenuItem(
        value: 1,
        child: Container(
            width: 150,
            height: 250,
            child: const Center(
              child: Text('you have no notifications yet((('),
            )),
      );
}

PopupMenuItem showFilterPop(context) {
  return PopupMenuItem(
    value: 1,
    child: Container(
        width: 150,
        height: 250,
        child: const Center(
          child: Text('there is no filter yet))'),
        )),
  );
}
