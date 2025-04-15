import 'package:flutter/material.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo1/index.dart';

class PantallaImagen extends StatelessWidget {
  const PantallaImagen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Modulo1()),
            );
          },
          child: Center(
            child: Image.asset(
              'assets/img/modulo1/juego/51.jpg',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
