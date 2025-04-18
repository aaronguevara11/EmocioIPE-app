import 'package:flutter/material.dart';
import 'package:emocioipe/Api/peticiones.dart';

class SegundaRespuesta extends StatefulWidget {
  final int idNivel;

  const SegundaRespuesta({super.key, required this.idNivel});

  @override
  State<SegundaRespuesta> createState() => _SegundaRespuestaState();
}

class _SegundaRespuestaState extends State<SegundaRespuesta> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  List<dynamic> respuestas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    try {
      final data = await _peticionesAPI.VerPrimeraQuiz(widget.idNivel);
      setState(() {
        respuestas = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error al cargar respuestas: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : respuestas.isEmpty
              ? const Center(child: Text("No hay respuestas registradas."))
              : SingleChildScrollView(
                  child: Column(
                    children: respuestas.map((respuesta) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          color: const Color.fromRGBO(255, 250, 240, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${respuesta['nombre']} ${respuesta['apaterno']} ",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "AlfaSlabOne",
                                  ),
                                ),
                                const Divider(thickness: 1),
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
