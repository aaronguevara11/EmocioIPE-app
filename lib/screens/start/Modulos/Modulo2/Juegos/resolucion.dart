import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo2/Juegos/indexJuegos.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo2/menu_conceptos.dart';
import 'package:flutter/material.dart';

class ResolucionConflictos extends StatefulWidget {
  const ResolucionConflictos({super.key});

  @override
  State<ResolucionConflictos> createState() => _ResolucionConflictosState();
}

class _ResolucionConflictosState extends State<ResolucionConflictos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: PageView(
        children: [
          _buildImage('assets/img/modulo2/Juegos/22.jfif', context),
          const Historia2(),
        ],
      ),
    );
  }

  Widget _buildImage(String assetPath, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class Historia2 extends StatefulWidget {
  const Historia2({super.key});

  @override
  State<Historia2> createState() => _Historia2State();
}

class _Historia2State extends State<Historia2> {
  int? selectedOption;
  bool answered = false;
  String feedbackMessage = "";
  PeticionesAPI _peticionesAPI = PeticionesAPI();

  void _onDoubleTap(int option) async {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        feedbackMessage = option == 3 ? "¡Correcto!" : "Incorrecto :(";
      });

      final respuesta = selectedOption;
      final trabajo = await _peticionesAPI.ResolucionEnviar(respuesta);

      if (trabajo == "Error") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al enviar la respuesta.'),
            backgroundColor: Color.fromARGB(255, 144, 36, 28),
          ),
        );
      }

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
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

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const IndexJuegos2()),
          );
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/img/modulo2/Juegos/24.png",
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        ),
      ),
    );
  }
}
