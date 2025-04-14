import 'package:emocioipe/screens/start/Modulos/Modulo2/menu_conceptos.dart';
import 'package:flutter/material.dart';

class Conceptos2 extends StatefulWidget {
  const Conceptos2({super.key});

  @override
  State<Conceptos2> createState() => _Conceptos2State();
}

class _Conceptos2State extends State<Conceptos2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/img/modulo2/1.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuConceptos2()));
                  },
                  child: Container(
                    height: 50,
                    width: 170,
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
                          fontSize: 20,
                          fontFamily: 'PTSans',
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
