import 'package:emocioipe/screens/start/Modulos/Modulo1/Juegos/emotiquiz.dart';
import 'package:flutter/material.dart';

class IndexJuegos extends StatefulWidget {
  const IndexJuegos({super.key});

  @override
  State<IndexJuegos> createState() => IndexJuegosState();
}

class IndexJuegosState extends State<IndexJuegos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/img/modulo1/46.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
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
                            builder: (context) => const EmotiQuiz()));
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
