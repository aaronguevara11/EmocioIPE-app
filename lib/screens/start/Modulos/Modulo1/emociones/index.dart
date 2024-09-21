import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexEmociones extends StatefulWidget {
  const IndexEmociones({super.key});

  @override
  State<IndexEmociones> createState() => _IndexEmocionesState();
}

class _IndexEmocionesState extends State<IndexEmociones> {
  bool _isButton2Enabled = false;
  bool _isButton3Enabled = false;
  bool _isButton4Enabled = false;
  bool _isButton5Enabled = false;
  bool _isButton6Enabled = false;

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
      _isButton4Enabled = prefs.getBool('isButton4Enabled') ?? false;
      _isButton5Enabled = prefs.getBool('isButton5Enabled') ?? false;
      _isButton6Enabled = prefs.getBool('isButton6Enabled') ?? false;
    });
  }

  Future<void> _navigateAndUnlock(Widget page, String key) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool(key, true);
      _loadButtonStates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/img/modulo1/7.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () =>
                      _navigateAndUnlock(const MiedoView(), 'isButton2Enabled'),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 10, right: 38, left: 38),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(171, 107, 170, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(17),
                      child: Center(
                        child: Text(
                          'MIEDO',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            letterSpacing: 2,
                            fontFamily: 'AlfaSlabOne',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _isButton2Enabled
                      ? () => _navigateAndUnlock(
                          const TristezaView(), 'isButton3Enabled')
                      : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 10, right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _isButton2Enabled
                          ? const Color.fromRGBO(89, 118, 155, 1.0)
                          : const Color.fromARGB(255, 48, 48, 48),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(17),
                      child: Center(
                        child: Text(
                          'TRISTEZA',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            letterSpacing: 2,
                            fontFamily: 'AlfaSlabOne',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _isButton3Enabled
                      ? () => _navigateAndUnlock(
                          const IraView(), 'isButton4Enabled')
                      : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 10, right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _isButton3Enabled
                          ? const Color.fromRGBO(212, 88, 55, 1.0)
                          : const Color.fromARGB(255, 48, 48, 48),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(17),
                      child: Center(
                        child: Text(
                          'IRA',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            letterSpacing: 2,
                            fontFamily: 'AlfaSlabOne',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _isButton4Enabled
                      ? () => _navigateAndUnlock(
                          const SorpresaView(), 'isButton5Enabled')
                      : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 10, right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _isButton4Enabled
                          ? const Color.fromRGBO(196, 104, 164, 1.0)
                          : const Color.fromARGB(255, 48, 48, 48),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(17),
                      child: Center(
                        child: Text(
                          'SORPRESA',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            letterSpacing: 2,
                            fontFamily: 'AlfaSlabOne',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _isButton5Enabled
                      ? () => _navigateAndUnlock(
                          const AversionView(), 'isButton6Enabled')
                      : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 10, right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _isButton5Enabled
                          ? const Color.fromRGBO(127, 147, 95, 1.0)
                          : const Color.fromARGB(255, 48, 48, 48),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(17),
                      child: Center(
                        child: Text(
                          'AVERSIÓN',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            letterSpacing: 2,
                            fontFamily: 'AlfaSlabOne',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _isButton6Enabled
                      ? () => _navigateAndUnlock(
                          const AlegriaView(), 'isButton6Enabled')
                      : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(bottom: 30, right: 38, left: 38),
                    decoration: BoxDecoration(
                      color: _isButton6Enabled
                          ? const Color.fromRGBO(248, 198, 74, 1.0)
                          : const Color.fromARGB(255, 48, 48, 48),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(17),
                      child: Center(
                        child: Text(
                          'ALEGRIA',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 247, 240, 1.0),
                            fontSize: 22,
                            letterSpacing: 2,
                            fontFamily: 'AlfaSlabOne',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MiedoView extends StatelessWidget {
  const MiedoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/8.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/9.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/10.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}

class TristezaView extends StatelessWidget {
  const TristezaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/12.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/13.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/14.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}

class IraView extends StatelessWidget {
  const IraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/16.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/17.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/18.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}

class SorpresaView extends StatelessWidget {
  const SorpresaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/20.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/21.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/22.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}

class AversionView extends StatelessWidget {
  const AversionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/24.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/25.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/26.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}

class AlegriaView extends StatelessWidget {
  const AlegriaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo1/28.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/29.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo1/30.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}
