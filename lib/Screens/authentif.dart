import 'package:flutter/material.dart';
import '../vars/variables.dart';
import 'package:china_app/networking/data_requests.dart';

class ConnectionState extends StatefulWidget {
  const ConnectionState({super.key});

  @override
  State<StatefulWidget> createState() => ConnectionStateState();
}

class ConnectionStateState extends State<ConnectionState>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    position = Tween<Offset>(begin: const Offset(0.0, -4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: SlideTransition(
          position: position,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 40,
            color: const Color.fromARGB(100, 47, 47, 47),
            child: const FittedBox(
              child: Text(
                'No internet connection',
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.none),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  bool isFocus = false;
  final emailController = TextEditingController();
  final pasController = TextEditingController();
  final _overlayEntry = OverlayEntry(builder: (BuildContext context) {
    return const ConnectionState();
  });

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
                  onPressed: () async {
                    if (!(await isConnected())) {
                       Navigator.of(context).overlay?.insert(_overlayEntry);
                      Future.delayed(const Duration(seconds: 10), () {
                        _overlayEntry.remove();
                      });
                    } else {
                      _loadScreenOpen();
                      await StartVars.getVars();
                      Navigator.pushReplacementNamed(context, '/MainScreen');
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
