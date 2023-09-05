import 'package:hl_flutter_app/generators/pop_up.dart';
import 'package:flutter/material.dart';
import 'package:hl_flutter_app/vars/variables.dart';

var statusIndex = ValueNotifier(-1);

//СЛАЙДЕР
class MainSlider extends StatelessWidget {
  const MainSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ValueListenableBuilder<int?>(
          valueListenable: statusIndex,
          builder: (context, statusIndex, child) {
            return createSlider(statusIndex);
          }),
    );
  }
}

// СОЗДАНИЕ БЛОКОВ СЛАЙДЕРА
Widget createSlider(whoActive) {
  final List<Widget> statusesList = [];
  final count = OrderInfoResult.length - 1;
  Color activeColor;

  for (int i = 0; i < count; i++) {
    if (whoActive == i) {
      activeColor = const Color.fromARGB(255, 34, 53, 147);
    } else {
      activeColor = const Color.fromARGB(255, 23, 38, 115);
    }
    statusesList.add(GestureDetector(
      onTap: () {
        statusIndex.value = i;
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

//СОЗДАНИЕ ТАБЛИЦЫ ЗАКАЗОВ
Widget createTransitTable(int statusIndex, String searchText, context) {
  List<Widget> baggagesWidgets = [];
  final count = transitsList.length;
  if (searchText != '') {
    for (int i = 0; i < count; i++) {
      if (transitsList[i].numberClient.contains(searchText.toUpperCase())) {
        addBaggages(baggagesWidgets, i, context);
      }
    }
  } else {
    for (int i = 0; i < count; i++) {
      if (statusIndex == -1) {
        addBaggages(baggagesWidgets, i, context);
      } else if (statusIndex == transitsList[i].statusInfo.value!.id) {
        addBaggages(baggagesWidgets, i, context);
      }
    }
  }

  if (baggagesWidgets.isEmpty) {
    return const Center(
      child: Text('there isnt any baggages'),
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

// СОЗДАНИЕ СПИСКА ЗАКАЗОВ
void addBaggages(List<Widget> List, int i, context) {

  List.add(
    InkWell(
      onTap: () {
        showTransModal(i, context);
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
                      color: StatusColor[transitsList[i].statusInfo.value?.id],
                    ),
                    const Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      transitsList[i].statusInfo.value!.statusName,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Text(
                  transitsList[i].numberClient,
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
                  transitsList[i].batch,
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
                      transitsList[i].destination,
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
