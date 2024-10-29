import 'package:flutter/material.dart';

class IdentiPlay extends StatefulWidget {
  const IdentiPlay({super.key});

  @override
  State<IdentiPlay> createState() => _IdentiPlayState();
}

class _IdentiPlayState extends State<IdentiPlay> {
  @override
  State<IdentiPlay> createState() => _Historia2State();
}

class _Historia2State extends State<IdentiPlay> {
  int? selectedOption;
  bool answered = false;
  String feedbackMessage = "";

  void _onDoubleTap(int option) {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        feedbackMessage = option == 3 ? "¡Correcto!" : "Incorrecto :(";
      });

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Resultado(),
          ),
        );
      });
    }
  }

  Color _getOptionColor(int option) {
    if (!answered) return const Color.fromARGB(255, 201, 224, 243);
    if (option == 3) {
      return const Color.fromARGB(255, 115, 220, 118);
    } else if (option == selectedOption) {
      return const Color.fromARGB(255, 225, 101, 92);
    } else {
      return const Color.fromARGB(255, 201, 224, 243);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              'assets/img/modulo2/Juegos/23.jfif',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white60,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'La diferencia de ideas y procedimientos abunda en la escuela. Sabiendo esto, ¿qué estrategia le recomendarías a los estudiantes para que solucionen el conflicto?',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () => _onDoubleTap(1),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: _getOptionColor(1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Establecer círculos restaurativos, donde los implicados y todos los afectados puedan poseer un espacio de diálogo para resarcir el daño ocasionado.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () => _onDoubleTap(2),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: _getOptionColor(2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'La nula intervención en conflictos, puesto que los responsables deben solucionar sus discrepancias sin ayuda de terceros.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () => _onDoubleTap(3),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: _getOptionColor(3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Asignar castigos severos a los responsables, con el objetivo de que la situación presentada no vuelva a ocurrir.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    feedbackMessage.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'AlfaSlabOne',
                      color: feedbackMessage == "¡Correcto!"
                          ? Colors.green
                          : Colors.red,
                      fontSize: 27,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
