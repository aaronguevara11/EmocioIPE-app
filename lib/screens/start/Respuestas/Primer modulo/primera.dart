import 'package:emocioipe/Api/peticiones.dart';
import 'package:flutter/material.dart';

class PrimeraRespuesta extends StatefulWidget {
  final int idNivel;

  const PrimeraRespuesta({super.key, required this.idNivel});

  @override
  State<PrimeraRespuesta> createState() => _PrimeraRespuestaState();
}

class _PrimeraRespuestaState extends State<PrimeraRespuesta> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  List<dynamic> respuestas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    var data = await _peticionesAPI.VerPrimeraQuiz(widget.idNivel);

    setState(() {
      respuestas = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: respuestas.map((respuesta) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Color.fromRGBO(255, 250, 240, 1),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${respuesta['nombre']} ${respuesta['apaterno']}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "AlfaSlabOne",
                              ),
                            ),
                            const Divider(),
                            _buildRespuestaItem(
                              'img1.jpg',
                              '¿Cómo sabes que emoción está sintiendo?',
                              respuesta['respuesta1'],
                            ),
                            _buildRespuestaItem(
                              'img2.jpg',
                              '¿Qué conoces sobre la emoción de la imagen?',
                              respuesta['respuesta2'],
                            ),
                            _buildRespuestaItem(
                              'img3.jpg',
                              'Describe la emoción de la imagen',
                              respuesta['respuesta3'],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }

  Widget _buildRespuestaItem(
      String imageName, String pregunta, String respuesta) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: Image.asset(
            'assets/img/modulo1/juego/$imageName',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pregunta,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  respuesta,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
