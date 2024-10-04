import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perfil'.toUpperCase(),
                  style: TextStyle(fontSize: 40, fontFamily: "AlfaSlabOne"),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text(
                      'DNI:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "87654321",
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text(
                      'Nombres:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Nombres y apellidos",
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text(
                      'Correo:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "example@gmail.com",
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text(
                      'Número:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "987654321",
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
