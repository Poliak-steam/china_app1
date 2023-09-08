// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hl_flutter_app/Collections/creditial_col.dart';
import 'package:hl_flutter_app/networking/network_func.dart';
import 'package:isar/isar.dart';

import '../functions/conn_loader.dart';
import '../networking/data_requests.dart';
import '../networking/request_vars.dart';
import '../vars/variables.dart';


class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final emailController = TextEditingController();
  final pasController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 23, 37, 110),
              Color.fromARGB(255, 18, 31, 83)
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            children: [
              Image(image: AssetImage('assets/img/logo.png')),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Text(
                'HIGHWAY',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              Text(
                'logistic group',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 45,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text(
                      'E-MAIL',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,

                        maxLength: 11,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: emailController,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 82, 114, 251),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () async {
                    if((await isConnected())&&(await isApiConnected())) {
                      final Map result = await postApi(
                          await RequestVar.checkAppClientToPhone(
                              emailController.text));

                      if (!result.keys.contains('error')) {
                        await load(context, result['result']);
                      } else {
                        print('cant authorize');
                      }
                    } else {
                      showDialog(context: context, builder: (BuildContext context) {
                        return  AlertDialog(
                          title: const Row(
                            children: [
                              Icon(Icons.error_outlined,color: Colors.red,size: 32,),
                              Padding(padding: EdgeInsets.only(right: 20)),
                              Expanded(child: FittedBox(child: Text('Can\'t connect to the server!'))),
                            ],
                          ),
                          content: Text('Do you still want to login?'),
                          actions: [
                            ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text('No')),
                            ElevatedButton(onPressed: () {
                              if(isar.creditials.count()!=0) {

                              }else {
                                //ПРОКИНУТЬ В ЛОАД ФУНКЦИЮ СОСТОЯНИЕ ПОДКЛЮЧЕНИЯ, И ЕСЛИ ФОЛЗ, ТО ПРОВЕРЯТЬ НАЛИЧИЕ ДАННЫХ О РЕГИСТРАЦИИ В ЛОКАЛЬНОЙ БАЗЕ ПОСЛЕ ЧЕГО ИНИЦИАЛИЗИРОВАТЬ ДАННЫЕ В СООТВЕТСВИИ С СОСТОЯНИЕМ ПОДКЛЮЧЕНИЯ
                              };
                            }, child: Text('Yes'))
                          ],
                        );
                      });

                    }

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 45,
                    child: const Text(
                      'Войти',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
          const Text(
            'Забыли пароль?',
            style: TextStyle(
              color: Color.fromARGB(255, 82, 114, 251),
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    ));
  }
}
