import 'package:emocioipe/screens/start/Modulos/Modulo2/Juegos/Juego2.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo2/Juegos/liderazgo.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo2/Juegos/resolucion.dart';
import 'package:flutter/material.dart';

class IndexJuegos2 extends StatefulWidget {
  const IndexJuegos2({super.key});

  @override
  State<IndexJuegos2> createState() => _IndexJuegos2State();
}

class _IndexJuegos2State extends State<IndexJuegos2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/img/modulo2/Juegos/menu.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Caso1()),
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
                                        'Comunicación',
                                        style: TextStyle(
                                          fontFamily: 'PTSans',
                                          fontSize: 25,
                                          height: 0.8,
                                          color: Color.fromRGBO(
                                              255, 247, 240, 1.0),
                                        ),
                                      ),
                                      Text(
                                        'asertiva',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JuegoTrabajo()),
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
                                    'Trabajo en equipo',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LiderazgoJuego()),
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
                                  'Liderazgo',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ResolucionConflictos()),
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
                                        'Resolución de',
                                        style: TextStyle(
                                          fontFamily: 'PTSans',
                                          fontSize: 25,
                                          height: 0.8,
                                          color: Color.fromRGBO(
                                              255, 247, 240, 1.0),
                                        ),
                                      ),
                                      Text(
                                        'conflictos',
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

class Caso1 extends StatelessWidget {
  const Caso1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: PageView(
        children: [
          _buildImage('assets/img/modulo2/Juegos/4.png', context),
          const Historia1(),
        ],
      ),
    );
  }

  Widget _buildImage(String assetPath, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class Caso2 extends StatelessWidget {
  const Caso2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: PageView(
        children: [
          _buildImage('assets/img/modulo2/Juegos/6.png', context),
          const Historia2()
        ],
      ),
    );
  }

  Widget _buildImage(String assetPath, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class Historia1 extends StatelessWidget {
  const Historia1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset(
            'assets/img/modulo2/Juegos/5.png',
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              maxLines: null,
              minLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.black,
                labelText: 'Escriba su respuesta',
                floatingLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Caso2()));
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 100,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    'Continuar'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'AlfaSlabOne'),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Historia2 extends StatelessWidget {
  const Historia2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset(
            'assets/img/modulo2/Juegos/7.png',
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              maxLines: null,
              minLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.black,
                labelText: 'Escriba su respuesta',
                floatingLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                            backgroundColor: Colors.white,
                            body: Center(
                              child: Image.asset(
                                  'assets/img/modulo2/Juegos/8.png'),
                            ),
                          )));
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 100,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    'Continuar'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'AlfaSlabOne'),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
