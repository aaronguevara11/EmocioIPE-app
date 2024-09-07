import 'package:emocioipe/screens/start/Modulos/Modulo1/definicion/definicion.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo1/emociones/index.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuConceptos extends StatefulWidget {
  const MenuConceptos({super.key});

  @override
  State<MenuConceptos> createState() => MenuConceptosState();
}

class MenuConceptosState extends State<MenuConceptos> {
  bool _isButton2Enabled = false;
  bool _isButton3Enabled = false;

  @override
  void initState() {
    super.initState();
    _loadButtonStates();
  }

  Future<void> _loadButtonStates() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isButton2Enabled = prefs.getBool('isButton2Enabled') ?? false;
      _isButton3Enabled = prefs.getBool('isButton3Enabled') ?? false;
    });
  }

  Future<void> _onFirstButtonPressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DefinicionEmocion()),
    );
    setState(() {
      _isButton2Enabled = true;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isButton2Enabled', true);
  }

  Future<void> _onSecondButtonPressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IndexEmociones()),
    );
    setState(() {
      _isButton3Enabled = true;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isButton3Enabled', true);
  }

  Future<void> _onThirdButtonPressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmocionesView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/img/modulo1/4.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _onFirstButtonPressed,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 38, left: 38),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 149, 11, 73),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                            color: Color.fromARGB(255, 28, 40, 81), width: 3),
                        vertical: BorderSide(
                            color: Color.fromARGB(255, 28, 40, 81), width: 3),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          '¿EMOCIONES?',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 25,
                            fontFamily: 'ArchivoBlack',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _isButton2Enabled ? _onSecondButtonPressed : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _isButton2Enabled
                          ? const Color.fromARGB(255, 149, 11, 73)
                          : const Color.fromARGB(255, 48, 48, 48),
                      border: const Border.symmetric(
                        horizontal: BorderSide(
                            color: Color.fromARGB(255, 28, 40, 81), width: 3),
                        vertical: BorderSide(
                            color: Color.fromARGB(255, 28, 40, 81), width: 3),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          '¿QUÉ EMOCIONES TENGO?',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            height: 1,
                            fontFamily: 'ArchivoBlack',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _isButton3Enabled ? _onThirdButtonPressed : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _isButton3Enabled
                          ? const Color.fromARGB(255, 149, 11, 73)
                          : const Color.fromARGB(255, 48, 48, 48),
                      border: const Border.symmetric(
                        horizontal: BorderSide(
                            color: Color.fromARGB(255, 28, 40, 81), width: 3),
                        vertical: BorderSide(
                            color: Color.fromARGB(255, 28, 40, 81), width: 3),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          '¿CÓMO PUEDO CONTROLAR MIS EMOCIONES?',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            height: 1,
                            fontFamily: 'ArchivoBlack',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EmocionesView extends StatelessWidget {
  const EmocionesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/32.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/33.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/34.jpg', fit: BoxFit.cover),
              const EmpatiaView()
            ],
          ),
        ));
  }
}

class EmpatiaView extends StatelessWidget {
  const EmpatiaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/img/modulo1/35.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 140,
                      margin: const EdgeInsets.only(bottom: 40),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 28, 40, 81),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Center(
                        child: Text(
                          'INICIAR',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'PTSans',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
