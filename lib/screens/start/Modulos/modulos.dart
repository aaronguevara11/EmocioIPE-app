import 'package:emocioipe/screens/start/Modulos/Modulo1/index.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo2/index.dart';
import 'package:flutter/material.dart';

class Modulos extends StatefulWidget {
  const Modulos({super.key});

  @override
  State<Modulos> createState() => _ModulosState();
}

class _ModulosState extends State<Modulos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Modulo1()),
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
                      'MÓDULO',
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
                        builder: (context) => const IndexModulo2()));
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
                      'MÓDULO',
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 15,
              height: MediaQuery.of(context).size.height / 6,
              child: const Card(
                margin: EdgeInsets.all(12),
                color: Color.fromARGB(255, 198, 204, 112),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                      child: Text(
                    'MÓDULO',
                    style: TextStyle(
                        fontFamily: 'PTSans',
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 15,
              height: MediaQuery.of(context).size.height / 6,
              child: const Card(
                margin: EdgeInsets.all(12),
                color: Color.fromARGB(255, 157, 73, 73),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                      child: Text(
                    'MÓDULO',
                    style: TextStyle(
                        fontFamily: 'PTSans',
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
