import 'package:emocioipe/screens/start/Modulos/Modulo4/Juegos/Actua%20Ya/indexActua.dart';
import 'package:flutter/material.dart';

class ActuaYa extends StatefulWidget {
  const ActuaYa({super.key});

  @override
  State<ActuaYa> createState() => _ActuaYaState();
}

class _ActuaYaState extends State<ActuaYa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/img/modulo4/20.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimeraActua()));
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
