import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Empatia extends StatefulWidget {
  const Empatia({super.key});

  @override
  State<Empatia> createState() => _EmpatiaState();
}

class _EmpatiaState extends State<Empatia> {
  bool _secondButtonE = false;
  bool _thirdButtonE = false;
  bool _fourthButtonE = false;

  @override
  void initState() {
    super.initState();
    _loadButtonStates();
  }

  Future<void> _loadButtonStates() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _secondButtonE = prefs.getBool('isSecondButtonEnabled') ?? false;
      _thirdButtonE = prefs.getBool('isThirdButtonEnabled') ?? false;
      _fourthButtonE = prefs.getBool('isFourthButtonEnabled') ?? false;
    });
  }

  Future<void> _onFirstBtnPressedE() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmpatiaVista()),
    );
    setState(() {
      _secondButtonE = true;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSecondButtonEnabled', true);
  }

  Future<void> _onSecondBtnPressedE() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SegundaVista()),
    );
    setState(() {
      _thirdButtonE = true;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isThirdButtonEnabled', true);
  }

  Future<void> _onThirdBtnPressedE() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TerceraVista()),
    );
    setState(() {
      _fourthButtonE = true;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFourthButtonEnabled', true);
  }

  Future<void> _onFourthBtnPressedE() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CuartaVista()),
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
              'assets/img/modulo1/36.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _onFirstBtnPressedE,
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
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          '¿EMPATÍA?',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            fontFamily: 'ArchivoBlack',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _secondButtonE ? _onSecondBtnPressedE : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _secondButtonE
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
                          '¿CÓMO SER\n EMPÁTICO?',
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
                  onTap: _thirdButtonE ? _onThirdBtnPressedE : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _thirdButtonE
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
                          '¿DONDE PUEDO PRESENCIARLA?',
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
                  onTap: _fourthButtonE ? _onFourthBtnPressedE : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _thirdButtonE
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
                          'ESTRATEGIAS PARA DESARROLLARLA',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 20,
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

class EmpatiaVista extends StatelessWidget {
  const EmpatiaVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/37.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}

class SegundaVista extends StatelessWidget {
  const SegundaVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/39.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}

class TerceraVista extends StatelessWidget {
  const TerceraVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/41.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/42.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}

class CuartaVista extends StatelessWidget {
  const CuartaVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/44.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}
