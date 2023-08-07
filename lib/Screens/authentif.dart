import 'package:china_app/vars/variables.dart';
import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final PasController = TextEditingController();
  final LogController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Container (
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter login',
                ),
                controller: LogController,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                ),
                controller: PasController,
              ),

              FloatingActionButton(onPressed: () async {
                /*if(
                PasController.text == 'Vjnbdfwbz21' &&
                    LogController.text == 'tech@freelancers-blag.ru'
                ) {
                  await StartVars.getVars();
                  Navigator.pushReplacementNamed(context, '/MainScreen');
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('WFT man? are u forgot the password? haha lol'),
                        actions: [
                          Center(
                            child: ElevatedButton(
                              child: Text('Try Again)'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      );
                    },
                  );
                  LogController.clear();
                  PasController.clear();
                }*/
                await StartVars.getVars();
                Navigator.pushReplacementNamed(context, '/MainScreen');
              })
            ],
          ),
        ),
      )
    );
  }
}
