import 'package:emocioipe/Api/peticiones.dart';
import 'package:flutter/material.dart';

class IndexRespuestaResolucion extends StatefulWidget {
  final int idNivel;
  const IndexRespuestaResolucion({super.key, required this.idNivel});

  @override
  State<IndexRespuestaResolucion> createState() =>
      _IndexRespuestaResolucionState();
}

class _IndexRespuestaResolucionState extends State<IndexRespuestaResolucion> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  List<dynamic> respuestas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    var data = await _peticionesAPI.VerResolucion(widget.idNivel);

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
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: respuestas.map((respuesta) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: Color.fromRGBO(255, 250, 240, 1),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
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
                                const Text(
                                  'Habiendo leído el caso anterior. ¿Qué estrategias de liderazgo le podrías recomendar a María? y ¿por qué? ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${respuesta['respuesta']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ));
  }
}
