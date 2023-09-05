import 'package:flutter/material.dart';
import 'package:hl_flutter_app/functions/conn_loader.dart';

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
                      'ПАРОЛЬ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    Expanded(
                      child: TextField(
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: pasController,
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
                  onPressed: () {
                    load(context);
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
