import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo4/index.dart';
import 'package:flutter/material.dart';

class TerceraActua extends StatefulWidget {
  const TerceraActua({super.key});

  @override
  State<TerceraActua> createState() => _TerceraActuaState();
}

class _TerceraActuaState extends State<TerceraActua> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController respuestaController = TextEditingController();
  String? emocionSeleccionada;
  final _peticionesAPI = PeticionesAPI();

  void seleccionarEmocion(String emocion) {
    setState(() {
      emocionSeleccionada = emocion;
    });
  }

  Future<void> enviarDatos() async {
    if (formKey.currentState!.validate() && emocionSeleccionada != null) {
      final idNivel = 3;
      final respuesta = respuestaController.text;
      final emocion = emocionSeleccionada;
      final resultado =
          await _peticionesAPI.ActuaEnviar(idNivel, emocion, respuesta);

      if (resultado == "Error") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al enviar la respuesta.'),
            backgroundColor: Color.fromARGB(255, 144, 36, 28),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FinalActuaView()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Debes seleccionar una emoción y escribir tu respuesta.'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 11, 73),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                      height: 200,
                      child: Image.asset(
                        'assets/img/modulo4/6.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Estás en las semanas finales del año escolar y los profesores han empezado a tomar muchos exámenes y dejar trabajos en exceso para completar notas. Asimismo, te duele mucho la cabeza de solo pensar que tienes que hacer todo eso, y se te ha ido la motivación. Además, se te ha ido el sueño por las noches.",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
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
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                            onTap: () => seleccionarEmocion("Estrés"),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: emocionSeleccionada == "Estrés"
                                    ? const Color.fromARGB(255, 92, 54, 141)
                                    : const Color.fromARGB(255, 35, 11, 65),
                              ),
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Estrés",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => seleccionarEmocion("Ansiedad"),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: emocionSeleccionada == "Ansiedad"
                                    ? const Color.fromARGB(255, 92, 54, 141)
                                    : const Color.fromARGB(255, 35, 11, 65),
                              ),
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Ansiedad",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
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
                          controller: respuestaController,
                          maxLines: null,
                          minLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Debe escribir una respuesta';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
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
                        onTap: enviarDatos,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
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
                                  fontFamily: 'AlfaSlabOne',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

class FinalActuaView extends StatelessWidget {
  const FinalActuaView({super.key});

  void _irAIndexModulo4(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const IndexModulo4()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _irAIndexModulo4(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: PageView(
            children: [
              Image.asset(
                'assets/img/modulo4/7.jpg',
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
