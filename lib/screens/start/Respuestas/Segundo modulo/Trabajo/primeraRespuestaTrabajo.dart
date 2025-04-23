import 'package:emocioipe/Api/peticiones.dart';
import 'package:flutter/material.dart';

class PrimeraRespuestaTrabajo extends StatefulWidget {
  final int idNivel;
  const PrimeraRespuestaTrabajo({super.key, required this.idNivel});

  @override
  State<PrimeraRespuestaTrabajo> createState() =>
      _PrimeraRespuestaTrabajoState();
}

class _PrimeraRespuestaTrabajoState extends State<PrimeraRespuestaTrabajo> {
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
                            Divider(),
                            _buildRespuestaItem(
                              '11.png',
                              'La historia contada suele ser frecuente en la escuela. Por eso, bajo tu experiencia, ¿Cuál consideras que fue el problema y qué hubieras hecho para mejorar la situación? ',
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
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Image.asset(
            'assets/img/modulo2/Juegos/$imageName',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
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
        )
      ],
    );
  }
}
