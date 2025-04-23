import 'package:emocioipe/Api/peticiones.dart';
import 'package:flutter/material.dart';

class SegundaRespuestaTrabajo extends StatefulWidget {
  final int idNivel;
  const SegundaRespuestaTrabajo({super.key, required this.idNivel});

  @override
  State<SegundaRespuestaTrabajo> createState() =>
      _SegundaRespuestaTrabajoState();
}

class _SegundaRespuestaTrabajoState extends State<SegundaRespuestaTrabajo> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  List<dynamic> respuestas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    var data = await _peticionesAPI.VerTrabajo(widget.idNivel);

    if (!mounted) return;

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
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${respuesta['nombre']} ${respuesta['apaterno']}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: "AlfaSlabOne",
                                ),
                              ),
                            ),
                            const Divider(),
                            _buildRespuestaItem(
                                'Habiendo visualizado el problema del grupo. ¿Qué estrategia de trabajo en equipo hubieses implementado en este caso? ',
                                respuesta['respuesta']),
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

  Widget _buildRespuestaItem(String pregunta, String respuesta) {
    return Padding(
      padding: EdgeInsets.all(7),
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
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
