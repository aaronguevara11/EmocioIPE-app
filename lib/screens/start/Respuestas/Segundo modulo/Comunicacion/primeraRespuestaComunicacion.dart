import 'package:emocioipe/Api/peticiones.dart';
import 'package:flutter/material.dart';

class PrimeraRespuestaComunicacion extends StatefulWidget {
  final int idNivel;

  const PrimeraRespuestaComunicacion({super.key, required this.idNivel});

  @override
  State<PrimeraRespuestaComunicacion> createState() =>
      _PrimeraRespuestaComunicacionState();
}

class _PrimeraRespuestaComunicacionState
    extends State<PrimeraRespuestaComunicacion> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  List<dynamic> respuestas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    var data = await _peticionesAPI.VerComunicacion(widget.idNivel);

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
                              '26.png',
                              'La historia de Jair no tuvo un final adecuado, ¿qué aspectos cambiarías de la historia para tener un final diferente?',
                              respuesta['respuesta'],
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
        Container(
          margin: EdgeInsets.only(right: 4),
          width: 100,
          child: Image.asset(
            'assets/img/modulo2/Juegos/$imageName',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.60,
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
