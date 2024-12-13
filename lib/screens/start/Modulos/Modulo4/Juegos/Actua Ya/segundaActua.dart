import 'package:emocioipe/screens/start/Modulos/Modulo4/Juegos/Actua%20Ya/terceraActua.dart';
import 'package:flutter/material.dart';

class SegundaActua extends StatefulWidget {
  const SegundaActua({super.key});

  @override
  State<SegundaActua> createState() => _SegundaActuaState();
}

class _SegundaActuaState extends State<SegundaActua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 11, 73),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.44,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    height: 220,
                    child: Image.asset(
                      'assets/img/modulo4/5.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "Hoy es el día de una competencia de atletismo muy importante para ti. Has practicado durante mucho tiempo y tus habilidades se han desarrollado al máximo; sin embargo, tienes dudas y preocupación de que no lo hagas bien y falles. Te siente tensionado y te hinca el pecho.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.56,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          '¿Qué crees que estás presentando?',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 35, 11, 65),
                            ),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Estrés",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      GestureDetector(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 35, 11, 65),
                            ),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Ansiedad",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: const Text(
                      "En base a lo seleccionado, de manera breve, describe cómo podrías manejar la situación y tomar el control nuevamente (3 ejemplos):",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TerceraActua()));
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
              ),
            ),
          ),
        ],
      )),
    );
  }
}
