import 'package:emocioipe/screens/start/Modulos/Modulo1/Juegos/juegos.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo1/emociones/conceptos.dart';
import 'package:flutter/material.dart';

class Modulo1 extends StatefulWidget {
  const Modulo1({super.key});

  @override
  State<Modulo1> createState() => _Modulo1State();
}

class _Modulo1State extends State<Modulo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/img/modulo1/1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ConceptosI()),
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          height: 104,
                          child: const Card(
                            margin: EdgeInsets.all(12),
                            color: Color.fromARGB(255, 35, 11, 65),
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Conceptos',
                                        style: TextStyle(
                                          fontFamily: 'PTSans',
                                          fontSize: 25,
                                          height: 0.8,
                                          color: Color.fromRGBO(
                                              255, 247, 240, 1.0),
                                        ),
                                      ),
                                      Text(
                                        'importantes',
                                        style: TextStyle(
                                          fontFamily: 'PTSans',
                                          fontSize: 25,
                                          height: 0.8,
                                          color: Color.fromRGBO(
                                              255, 247, 240, 1.0),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IndexJuegos()),
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          height: 104,
                          child: const Card(
                            margin: EdgeInsets.all(12),
                            color: Color.fromARGB(255, 35, 11, 65),
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Juegos',
                                    style: TextStyle(
                                      fontFamily: 'PTSans',
                                      fontSize: 25,
                                      height: 0.8,
                                      color: Color.fromRGBO(255, 247, 240, 1.0),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Modulo1()),
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          height: 104,
                          child: const Card(
                            margin: EdgeInsets.all(12),
                            color: Color.fromARGB(255, 35, 11, 65),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Bibliografía',
                                  style: TextStyle(
                                    fontFamily: 'PTSans',
                                    fontSize: 25,
                                    height: 0.8,
                                    color: Color.fromRGBO(255, 247, 240, 1.0),
                                  ),
                                ),
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
          )
        ],
      ),
    );
  }
}
