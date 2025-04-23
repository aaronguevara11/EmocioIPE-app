import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo2/Juegos/indexJuegos.dart';
import 'package:flutter/material.dart';

class JuegoTrabajo extends StatefulWidget {
  const JuegoTrabajo({super.key});

  @override
  State<JuegoTrabajo> createState() => _JuegoTrabajoState();
}

class _JuegoTrabajoState extends State<JuegoTrabajo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: PageView(
        children: [
          _buildImage('assets/img/modulo2/Juegos/10.png', context),
          const Historia1()
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

class Historia1 extends StatefulWidget {
  const Historia1({super.key});

  @override
  State<Historia1> createState() => _Historia1State();
}

class _Historia1State extends State<Historia1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _respuestaController = TextEditingController();
  final PeticionesAPI _peticionesAPI = PeticionesAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.60,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 40, left: 10, right: 10),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: Text(
                              'La historia contada suele ser frecuente en la escuela. Por eso, bajo tu experiencia, ¿Cuál consideras que fue el problema y qué hubieras hecho para mejorar la situación?',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: TextFormField(
                          controller: _respuestaController,
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
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'No puede dejar este campo vacío';
                            }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final respuesta = _respuestaController.text.trim();

                            final response =
                                await _peticionesAPI.TrabajoEnviar(respuesta);

                            if (response == "Error") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Hubo un error al enviar la respuesta'),
                                  backgroundColor:
                                      Color.fromARGB(255, 150, 0, 0),
                                ),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Caso2()),
                              );
                            }
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width - 100,
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                'Continuar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'AlfaSlabOne',
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: Image.asset(
                    'assets/img/modulo2/Juegos/11.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Caso2 extends StatelessWidget {
  const Caso2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: PageView(
        children: [
          _buildImage('assets/img/modulo2/Juegos/12.png', context),
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

  final List<String> opcionesTexto = [
    'Una reflexión grupal que permita identificar la forma en cómo se está trabajando dentro del equipo, permitiendo mejorar aspectos como la organización o la comunicación.',
    'Una elección adecuada de los miembros del grupo, los cuales pueden trabajar individualmente y en subgrupos porque esa es la manera adecuada de trabajar en equipo.',
    'Designar responsables, esto nos permitirá rescatar el trabajo propio, donde el maestro visualizará a los culpables y resaltará el trabajo aislado elaborado por los participantes del grupo.',
  ];

  void _onDoubleTap(int option) async {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        feedbackMessage = option == 1 ? "¡Correcto!" : "Incorrecto :(";
      });

      final respuestaTexto = opcionesTexto[option - 1];

      final trabajo = await _peticionesAPI.TrabajoEnviar2(respuestaTexto);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Imagen superior
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
              'assets/img/modulo2/Juegos/13.png',
              fit: BoxFit.cover,
            ),
          ),
          // Contenido central
          Container(
            color: Colors.white60,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: opcionesTexto.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedOption == index + 1;
                      final isCorrect = index == 0;

                      return GestureDetector(
                        onDoubleTap: () => _onDoubleTap(index + 1),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? (isCorrect
                                    ? const Color.fromARGB(255, 115, 220, 118)
                                    : const Color.fromARGB(255, 225, 101, 92))
                                : const Color.fromARGB(255, 201, 224, 243),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              opcionesTexto[index],
                              style: const TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
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
          // Imagen inferior
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset(
              'assets/img/modulo2/Juegos/14.png',
              fit: BoxFit.cover,
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
                "assets/img/modulo2/Juegos/15.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
