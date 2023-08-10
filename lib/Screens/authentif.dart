import 'package:flutter/material.dart';
import '../vars/variables.dart';

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final int state = 0;
  bool isFocus = false;
  final emailController = TextEditingController();
  final pasController = TextEditingController();

  Widget _createWelcome(bool state) {
    if (state == false) {
      return const Expanded(
        flex: 2,
        child: Text(
          'Добро пожаловать!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );
    } else
      return Container();
  }
  Widget createLogoText (state) {
    if (state == false) {
      return const Column(
        children: [
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
      );
    } else return Container();
  }

  void _loadScreenOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('loading...'),
              Icon(Icons.accessible_forward),
            ],
          ),
        ),
      );
    }));
  }

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
      padding: EdgeInsets.only(top: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Image(image: AssetImage('assets/img/logo.png')),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                createLogoText(isFocus)
              ],
            ),
          ),
          _createWelcome(isFocus),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Container(
                  height: 45,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'E-MAIL',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      Expanded(
                        child: FocusScope(
                          child: Focus(
                            onFocusChange: (focus) {
                              setState(() {
                                isFocus = focus;
                              });
                            },
                            child: TextField(
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              controller: emailController,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Container(
                  height: 45,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'ПАРОЛЬ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      Expanded(
                        child: FocusScope(
                          child: Focus(
                            onFocusChange: (focus) {
                              setState(() {
                                isFocus = focus;
                              });
                            },
                            child: TextField(
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              controller: pasController,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 82, 114, 251),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () async {
                      _loadScreenOpen();
                      await StartVars.getVars();
                      Navigator.pushReplacementNamed(context, '/MainScreen');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 45,
                      child: Text(
                        'Войти',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Text(
                'Забыли пароль?',
                style: TextStyle(
                  color: Color.fromARGB(255, 82, 114, 251),
                  decoration: TextDecoration.underline,
                ),
              ))
        ],
      ),
    ));
  }
}

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
