import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo2/Juegos/indexJuegos.dart';
import 'package:flutter/material.dart';

class LiderazgoJuego extends StatefulWidget {
  const LiderazgoJuego({super.key});

  @override
  State<LiderazgoJuego> createState() => _LiderazgoJuegoState();
}

class _LiderazgoJuegoState extends State<LiderazgoJuego> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: PageView(
        children: [
          _buildImage('assets/img/modulo2/Juegos/17.png', context),
          const Primera2()
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
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
      ),
    );
  }
}

class Primera2 extends StatefulWidget {
  const Primera2({super.key});

  @override
  State<Primera2> createState() => _Primera2State();
}

class _Primera2State extends State<Primera2> {
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
                            margin: const EdgeInsets.only(
                                top: 40, left: 10, right: 10),
                            child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  'Un liderazgo inadecuado puede afectar el buen desarrollo estudiantil en las escuelas, sabiendo esto ¿qué podrías modificar de la historia para mejorar la situación? ',
                                  style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.justify,
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
                                final respuesta = _respuestaController.text;

                                final response =
                                    await _peticionesAPI.LiderazgoEnviar(
                                        respuesta);

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
                                        builder: (context) =>
                                            const Liderazgo2G()),
                                  );
                                }
                              }
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
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
                        'assets/img/modulo2/Juegos/18.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}

class Liderazgo2G extends StatefulWidget {
  const Liderazgo2G({super.key});

  @override
  State<Liderazgo2G> createState() => _Liderazgo2GState();
}

class _Liderazgo2GState extends State<Liderazgo2G> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: PageView(
        children: [
          _buildImage('assets/img/modulo2/Juegos/19.png', context),
          const LiderazgoJuego2()
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
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
      ),
    );
  }
}

class LiderazgoJuego2 extends StatefulWidget {
  const LiderazgoJuego2({super.key});

  @override
  State<LiderazgoJuego2> createState() => _LiderazgoJuego2State();
}

class _LiderazgoJuego2State extends State<LiderazgoJuego2> {
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
                        'assets/img/modulo2/Juegos/20.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  'Habiendo leído el caso anterior. ¿Qué estrategias de liderazgo le podrías recomendar a María? y ¿por qué? ',
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.justify,
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
                                final respuesta = _respuestaController.text;

                                final response =
                                    await _peticionesAPI.LiderazgoEnviar2(
                                        respuesta);

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
                                        builder: (context) =>
                                            const Resultado2()),
                                  );
                                }
                              }
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
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
              ))),
    );
  }
}

class Resultado2 extends StatefulWidget {
  const Resultado2({super.key});

  @override
  State<Resultado2> createState() => _Resultado2State();
}

class _Resultado2State extends State<Resultado2> {
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
        child: SizedBox.expand(
          child: Image.asset(
            "assets/img/modulo2/Juegos/21.png",
          ),
        ),
      ),
    );
  }
}
