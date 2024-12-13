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

  void _onDoubleTap(int option) {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        // Lógica para determinar si la opción es correcta
        feedbackMessage = (option == 1 || option == 2 || option == 3)
            ? "¡Correcto!"
            : "¡Incorrecto :(!";
      });

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
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
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _onDoubleTap(1),
                    child: Container(
                      margin: const EdgeInsets.all(5),
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
                            'Momentos antes de la exposición de una tarea',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors
                                  .white, // Esto hace que el texto sea blanco
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onDoubleTap(4),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: _getOptionColor(4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Facilidad para hablar en publico',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors
                                  .white, // Esto hace que el texto sea blanco
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onDoubleTap(2),
                    child: Container(
                      margin: const EdgeInsets.all(5),
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
                            'El niño parado desearía no estar ahi',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors
                                  .white, // Esto hace que el texto sea blanco
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onDoubleTap(3),
                    child: Container(
                      margin: const EdgeInsets.all(5),
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
                            'Es una situación común',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors
                                  .white, // Esto hace que el texto sea blanco
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

class Pregunta4 extends StatefulWidget {
  const Pregunta4({super.key});

  @override
  State<Pregunta4> createState() => _Pregunta4State();
}

class _Pregunta4State extends State<Pregunta4> {
  int? selectedOption;
  bool answered = false;
  String feedbackMessage = "";
  // Controlador para el TextField
  final TextEditingController _controller = TextEditingController();
  // Variable para guardar el texto
  String userInput = '';

  void _onDoubleTap(int option) {
    if (!answered) {
      setState(() {
        userInput = _controller
            .text; // Guarda el texto en la variable para tu back de aca haces la peticion y lo envias

        selectedOption = option;
        answered = true;
        // Lógica para determinar si la opción es correcta
        feedbackMessage = (option == 1 || option == 2 || option == 3)
            ? "¡Enviado!"
            : "¡Incorrecto :(!";
      });

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Pregunta2(),
          ),
        );
      });
    }
  }

  Color _getOptionColor(int option) {
    if (!answered) return const Color.fromARGB(255, 44, 64, 118);
    if (option == 1 || option == 2 || option == 3) {
      return const Color.fromARGB(255, 44, 64, 118);
    } else if (option == 4) {
      return const Color.fromARGB(255, 225, 101, 92);
    } else {
      return const Color.fromARGB(44, 64, 118, 255);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Asegura que el teclado no cubra los elementos
      body: SingleChildScrollView(
        // Hacer el contenido desplazable
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Imagen
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.68,
              child: Image.asset(
                'assets/img/modulo3/Juego/5_real.png',
                fit: BoxFit.cover,
              ),
            ),

            // Contenedor con el input y el botón
            Container(
              color: Colors.white60,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Texto encima del input
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller:
                            _controller, // Asocia el controlador al TextField
                        decoration: const InputDecoration(
                          labelText: 'Tu respuesta',
                          labelStyle: TextStyle(color: Colors.black54),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black), // Borde negro
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.yellow), // Borde amarillo
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        maxLines: 1, // Limitar a una sola línea
                      ),
                    ),

                    // Botón
                    GestureDetector(
                      onTap: () => _onDoubleTap(1),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width *
                            0.45, // 50% menos margen
                        decoration: BoxDecoration(
                          color: _getOptionColor(1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
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
                    const SizedBox(height: 10),
                    Text(
                      feedbackMessage.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'AlfaSlabOne',
                        color: feedbackMessage == "¡Enviado!"
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

  void _onDoubleTap(int option) {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        // Lógica para determinar si la opción es correcta
        feedbackMessage = (option == 1 || option == 2 || option == 3)
            ? "¡Correcto!"
            : "¡Incorrecto :(!";
      });

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
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
                padding: EdgeInsets.all(20),
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
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => _onDoubleTap(1),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
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
                                'Una madre ayudando a su hija con la tarea.',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors
                                      .white, // Esto hace que el texto sea blanco
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onDoubleTap(3),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
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
                                'Hay muchos platos por lavar',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors
                                      .white, // Esto hace que el texto sea blanco
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onDoubleTap(2),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
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
                                'Una hija ayudando a su mamá con la tarea',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors
                                      .white, // Esto hace que el texto sea blanco
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onDoubleTap(4),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: _getOptionColor(4),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                'La mamá con su hija están jugando en la cocina',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors
                                      .white, // Esto hace que el texto sea blanco
                                ),
                                textAlign: TextAlign.center,
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

  void _onDoubleTap(int option) {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        // Lógica para determinar si la opción es correcta
        feedbackMessage = (option == 1 || option == 2 || option == 3)
            ? "¡Correcto!"
            : "¡Incorrecto :(!";
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
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
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
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _onDoubleTap(1),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width *
                              0.45, // 50% menos margen
                          height: MediaQuery.of(context).size.width *
                              0.15, // Para hacerlo cuadrado
                          decoration: BoxDecoration(
                            color: _getOptionColor(1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                'Miedo',
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
                      GestureDetector(
                        onTap: () => _onDoubleTap(3),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: _getOptionColor(3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text('Preocupación',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  selectionColor:
                                      Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _onDoubleTap(1),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: _getOptionColor(1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                'Ansiedad',
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
                      GestureDetector(
                        onTap: () => _onDoubleTap(4),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: _getOptionColor(4),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                'Satisfacción',
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
                    ],
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
  int? selectedOption;
  bool answered = false;
  String feedbackMessage = "";
  // Controlador para el TextField
  final TextEditingController _controller2 = TextEditingController();
  // Variable para guardar el texto
  String userInput = '';

  void _onDoubleTap(int option) {
    if (!answered) {
      setState(() {
        userInput = _controller2
            .text; // Guarda el texto en la variable para tu back de aca haces la peticion y lo envias

        selectedOption = option;
        answered = true;
        // Lógica para determinar si la opción es correcta
        feedbackMessage = (option == 1 || option == 2 || option == 3)
            ? "¡Enviado!"
            : "¡Incorrecto :(!";
      });
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Pregunta3(),
          ),
        );
      });
    }
  }

  Color _getOptionColor(int option) {
    if (!answered) return const Color.fromARGB(255, 44, 64, 118);
    if (option == 1 || option == 2 || option == 3) {
      return const Color.fromARGB(255, 44, 64, 118);
    } else if (option == 4) {
      return const Color.fromARGB(255, 225, 101, 92);
    } else {
      return const Color.fromARGB(44, 64, 118, 255);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Asegura que el teclado no cubra los elementos
      body: SingleChildScrollView(
        // Hacer el contenido desplazable
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Imagen
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/img/modulo3/Juego/8_real.png',
                fit: BoxFit.cover,
              ),
            ),

            // Contenedor con el input y el botón
            Container(
              color: Colors.white60,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Texto encima del input
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller:
                            _controller2, // Asocia el controlador al TextField
                        decoration: const InputDecoration(
                          labelText: 'Tu respuesta',
                          labelStyle: TextStyle(color: Colors.black54),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black), // Borde negro
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.yellow), // Borde amarillo
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        maxLines: 1, // Limitar a una sola línea
                      ),
                    ),

                    // Botón
                    GestureDetector(
                      onTap: () => _onDoubleTap(1),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width *
                            0.45, // 50% menos margen
                        decoration: BoxDecoration(
                          color: _getOptionColor(1),
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
                        color: feedbackMessage == "¡Enviado!"
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
      ),
    );
  }
}

class Resultado extends StatelessWidget {
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          // Ocupa todo el espacio disponible
          child: Image.asset(
            'assets/img/modulo3/Juego/final_real.png', // No es necesario const aquí
            fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el espacio
          ),
        ),
      ),
    );
  }
}
