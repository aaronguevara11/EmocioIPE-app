import 'package:emocioipe/screens/start/Respuestas/Cuarto%20modulo/indexCuarto.dart';
import 'package:emocioipe/screens/start/Respuestas/Primer%20modulo/indexRespuesta1.dart';
import 'package:emocioipe/screens/start/Respuestas/Segundo%20modulo/MenuRespuestas2.dart';
import 'package:emocioipe/screens/start/Respuestas/Tercer%20modulo/indexTercerModulo.dart';
import 'package:flutter/material.dart';

class IndexRespuestas extends StatefulWidget {
  const IndexRespuestas({super.key});

  @override
  State<IndexRespuestas> createState() => _IndexRespuestasState();
}

class _IndexRespuestasState extends State<IndexRespuestas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RESPUESTAS'.toUpperCase(),
              style: TextStyle(fontSize: 40, fontFamily: "AlfaSlabOne"),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndexRespuesta1()),
                );
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 15,
                height: MediaQuery.of(context).size.height / 6,
                child: const Card(
                  margin: EdgeInsets.all(12),
                  color: Color.fromARGB(255, 71, 73, 152),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                        child: Text(
                      'MÓDULO I',
                      style: TextStyle(
                          fontFamily: 'PTSans',
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
                        builder: (context) => const MenuRespuestas2()));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 15,
                height: MediaQuery.of(context).size.height / 6,
                child: const Card(
                  margin: EdgeInsets.all(12),
                  color: Color.fromARGB(255, 79, 169, 79),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                        child: Text(
                      'MÓDULO II',
                      style: TextStyle(
                          fontFamily: 'PTSans',
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
                        builder: (context) => const IndexTercerModulo()));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 15,
                height: MediaQuery.of(context).size.height / 6,
                child: const Card(
                  margin: EdgeInsets.all(12),
                  color: Color.fromARGB(255, 198, 204, 112),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                        child: Text(
                      'MÓDULO III',
                      style: TextStyle(
                          fontFamily: 'PTSans',
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
                        builder: (context) => const IndexRespuesta4()));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 15,
                height: MediaQuery.of(context).size.height / 6,
                child: const Card(
                  margin: EdgeInsets.all(12),
                  color: Color.fromARGB(255, 157, 73, 73),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                        child: Text(
                      'MÓDULO IV',
                      style: TextStyle(
                          fontFamily: 'PTSans',
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
