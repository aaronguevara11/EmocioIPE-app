import 'package:flutter/material.dart';

class DefinicionEmocion extends StatefulWidget {
  const DefinicionEmocion({super.key});

  @override
  State<DefinicionEmocion> createState() => __DefinicionEmocionState();
}

class __DefinicionEmocionState extends State<DefinicionEmocion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/img/modulo1/5.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
