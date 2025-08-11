import 'package:flutter/material.dart';

class Bibliografia1 extends StatefulWidget {
  const Bibliografia1({super.key});

  @override
  State<Bibliografia1> createState() => _Bibliografia1State();
}

class _Bibliografia1State extends State<Bibliografia1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bibliografias'.toUpperCase(),
                style: TextStyle(fontSize: 35, fontFamily: "AlfaSlabOne"),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Asociación Española Contra el Cáncer. (2010). Emociones. Comprenderlas para vivir mejor. https://fundadeps.org/recursos/Emociones-Comprenderlas-para-vivir-mejor/',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Patón, L. (2022). ¿Qué es la empatía?. Canvis. https://www.canvis.es/es/que-es-la-empatia/',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Oficina de las Naciones Unidas contra la Droga y el Delito. (s.f). La ciencia de la empatía. https://www.unodc.org/unodc/es/listen-first/super-skills/empathy.html ',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ekman, P. (2017). El rostro de las emociones: qué nos revelan las expresiones faciales. RBA BOLSILLO.',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
