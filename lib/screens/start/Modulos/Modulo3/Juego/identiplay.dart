import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo3/index.dart';
import 'package:flutter/material.dart';

class IdentiPlay extends StatefulWidget {
  const IdentiPlay({super.key});

  @override
  State<IdentiPlay> createState() => _IdentiPlayState();
}

class _IdentiPlayState extends State<IdentiPlay> {
  int? selectedOption;
  bool answered = false;
  String feedbackMessage = "";
  PeticionesAPI _peticionesAPI = PeticionesAPI();

  final List<String> opciones = [
    'Momentos antes de la exposición de una tarea',
    'El niño parado desearía no estar ahi',
    'Es una situación común',
    'Facilidad para hablar en publico',
  ];

  void _onDoubleTap(int option) async {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        feedbackMessage = (option == 1 || option == 2 || option == 3)
            ? "¡Correcto!"
            : "¡Incorrecto :(!";
      });

      final respuesta = opciones[option - 1];
      final idNivel = 2;

      final trabajo = await _peticionesAPI.ResolucionEnviar(idNivel, respuesta);

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
            builder: (context) => const Pregunta4(),
          ),
        );
      });
    }
  }

  Color _getOptionColor(int option) {
    if (!answered) return const Color.fromARGB(255, 149, 11, 73);

    if (option == 1 || option == 2 || option == 3) {
      return const Color.fromARGB(255, 115, 220, 118);
    } else if (option == 4) {
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
            height: MediaQuery.of(context).size.height * 0.6,
            child: Image.asset(
              'assets/img/modulo3/Juego/3_real.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white60,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: List.generate(opciones.length, (index) {
                  return GestureDetector(
                    onTap: () => _onDoubleTap(index + 1),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: _getOptionColor(index + 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            opciones[index],
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )),
          ),
          const SizedBox(height: 10),
          Text(
            feedbackMessage.toUpperCase(),
            style: TextStyle(
              fontFamily: 'AlfaSlabOne',
              color:
                  feedbackMessage == "¡Correcto!" ? Colors.green : Colors.red,
              fontSize: 27,
            ),
          ),
        ],
      ),
    );
  }
}

class Pregunta4 extends StatefulWidget {
  const Pregunta4({super.key});

  @override
  State<Pregunta4> createState() => _Pregunta4State();
}

class _Pregunta4State extends State<Pregunta4> {
  final TextEditingController _controller = TextEditingController();
  String feedbackMessage = "";
  bool isSending = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  PeticionesAPI _peticionesAPI = PeticionesAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/img/modulo3/Juego/5_real.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.white60,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Tu respuesta',
                        labelStyle: TextStyle(color: Colors.black54),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Debe enviar una respuesta';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          final String respuesta = _controller.text;
                          final idNivel = 3;

                          final trabajo = await _peticionesAPI.ResolucionEnviar(
                            idNivel,
                            respuesta,
                          );

                          if (trabajo == "Error") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error al enviar la respuesta.'),
                                backgroundColor:
                                    Color.fromARGB(255, 144, 36, 28),
                              ),
                            );
                          }

                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Pregunta2(),
                              ),
                            );
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 24, 42, 88),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'ENVIAR',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pregunta2 extends StatefulWidget {
  const Pregunta2({super.key});

  @override
  State<Pregunta2> createState() => _Pregunta2State();
}

class _Pregunta2State extends State<Pregunta2> {
  int? selectedOption;
  bool answered = false;
  String feedbackMessage = "";
  PeticionesAPI _peticionesAPI = PeticionesAPI();

  final List<String> opciones = [
    'Una madre ayudando a su hija con la tarea.',
    'Hay muchos platos por lavar',
    'Una hija ayudando a su mamá con la tarea',
    'La mamá con su hija están jugando en la cocina',
  ];

  void _onDoubleTap(int option) async {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        feedbackMessage = (option == 1 || option == 2 || option == 3)
            ? "¡Correcto!"
            : "¡Incorrecto :(!";
      });

      final respuesta = opciones[option - 1];
      final idNivel = 4;

      final trabajo = await _peticionesAPI.ResolucionEnviar(idNivel, respuesta);

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
            builder: (context) => const Pregunta5(),
          ),
        );
      });
    }
  }

  Color _getOptionColor(int option) {
    if (!answered) return const Color.fromARGB(255, 149, 11, 73);
    if (option == 1 || option == 2 || option == 3) {
      return const Color.fromARGB(255, 115, 220, 118);
    } else if (option == 4) {
      return const Color.fromARGB(255, 225, 101, 92);
    } else {
      return const Color.fromARGB(255, 201, 224, 243);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/img/modulo3/Juego/6.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
              color: Colors.white60,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "¿Qué podemos decir de la imagen anterior?",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(opciones.length, (index) {
                        return GestureDetector(
                          onTap: () => _onDoubleTap(index + 1),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: _getOptionColor(index + 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  opciones[index],
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
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
              )),
        ],
      ),
    );
  }
}

class Pregunta3 extends StatefulWidget {
  const Pregunta3({super.key});

  @override
  State<Pregunta3> createState() => _Pregunta3State();
}

class _Pregunta3State extends State<Pregunta3> {
  int? selectedOption;
  bool answered = false;
  String feedbackMessage = "";
  final PeticionesAPI _peticionesAPI = PeticionesAPI();

  final List<Map<String, dynamic>> opciones = [
    {"texto": "Miedo", "valor": 1},
    {"texto": "Preocupación", "valor": 3},
    {"texto": "Ansiedad", "valor": 2},
    {"texto": "Satisfacción", "valor": 4},
  ];

  Color _getOptionColor(int option) {
    if (!answered) return const Color.fromARGB(255, 44, 64, 118);
    if (option == 1 || option == 2 || option == 3) {
      return const Color.fromARGB(255, 115, 220, 118);
    } else if (option == 4) {
      return const Color.fromARGB(255, 225, 101, 92);
    } else {
      return const Color.fromARGB(44, 64, 118, 255);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: SizedBox(
              width: width,
              height: MediaQuery.of(context).size.height * 0.65,
              child: Image.asset(
                'assets/img/modulo3/Juego/9_real.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white60,
            height: MediaQuery.of(context).size.height * 0.3,
            width: width,
            child: Center(
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: opciones.map((opcion) {
                      return GestureDetector(
                        onDoubleTap: () async {
                          if (!answered) {
                            setState(() {
                              selectedOption = opcion["valor"];
                              answered = true;
                              feedbackMessage = (selectedOption == 1 ||
                                      selectedOption == 2 ||
                                      selectedOption == 3)
                                  ? "¡Correcto!"
                                  : "¡Incorrecto :(!";
                            });

                            final idNivel = 6;
                            final respuesta = opcion["texto"];

                            final resultado =
                                await _peticionesAPI.ResolucionEnviar(
                                    idNivel, respuesta);

                            if (resultado == "Error") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Error al enviar la respuesta.'),
                                  backgroundColor:
                                      Color.fromARGB(255, 144, 36, 28),
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
                        },
                        child: Container(
                          width: width * 0.45,
                          height: width * 0.15,
                          decoration: BoxDecoration(
                            color: _getOptionColor(opcion["valor"]),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              opcion["texto"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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

class Pregunta5 extends StatefulWidget {
  const Pregunta5({super.key});

  @override
  State<Pregunta5> createState() => _Pregunta5State();
}

class _Pregunta5State extends State<Pregunta5> {
  final TextEditingController _controller = TextEditingController();
  String feedbackMessage = "";
  bool isSending = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  PeticionesAPI _peticionesAPI = PeticionesAPI();

  @override
  Widget build(BuildContext context) {
    final altoPantalla = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/modulo3/Juego/8_real.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.white60,
                height: altoPantalla * 0.32,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Tu respuesta',
                        labelStyle: TextStyle(color: Colors.black54),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Debe enviar una respuesta';
                        }
                        return null;
                      },
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          final String respuesta = _controller.text;
                          final idNivel = 5;

                          final trabajo = await _peticionesAPI.ResolucionEnviar(
                              idNivel, respuesta);

                          if (trabajo == "Error") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error al enviar la respuesta.'),
                                backgroundColor:
                                    Color.fromARGB(255, 144, 36, 28),
                              ),
                            );
                          }

                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Pregunta3(),
                              ),
                            );
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 44, 64, 118),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'Enviar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
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
                        color: feedbackMessage == "¡ENVIADO!"
                            ? Colors.green
                            : Colors.red,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Resultado extends StatelessWidget {
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IndexModulo3(),
            ),
          );
        },
        child: Center(
          child: SizedBox(
            child: Image.asset(
              'assets/img/modulo3/Juego/final_real.png',
              fit: BoxFit.cover,
            ),
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
