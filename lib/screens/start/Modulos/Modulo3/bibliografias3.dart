import 'package:flutter/material.dart';

class Bibliografias3 extends StatefulWidget {
  const Bibliografias3({super.key});

  @override
  State<Bibliografias3> createState() => _Bibliografias3State();
}

class _Bibliografias3State extends State<Bibliografias3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 40, bottom: 15),
        child: SingleChildScrollView(
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
                          'Organización Mundial de La Salud (2023). Estrés. https://acortar.link/B60Mjx ',
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
                          'Mayo Clinic (2023). Síntomas de estrés: consecuencias en tu cuerpo y en tu conducta. https://acortar.link/NCwR5Z',
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
                          'Organización Mundial de la Salud (2023). Trastornos de ansiedad. https://www.who.int/es/news-room/fact-sheets/detail/anxiety-disorders',
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
                          'Sociedad Española de Medicina Interna (s.f.). Ansiedad. https://www.fesemi.org/informacion-pacientes/conozca-mejor-su-enfermedad/ansiedad ',
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
