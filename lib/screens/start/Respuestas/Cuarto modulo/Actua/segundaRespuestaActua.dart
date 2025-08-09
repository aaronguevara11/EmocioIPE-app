import 'package:emocioipe/Api/peticiones.dart';
import 'package:flutter/material.dart';

class SegundaRespuestaActua extends StatefulWidget {
  final int idNivel;
  const SegundaRespuestaActua({super.key, required this.idNivel});

  @override
  State<SegundaRespuestaActua> createState() => _SegundaRespuestaActuaState();
}

class _SegundaRespuestaActuaState extends State<SegundaRespuestaActua> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  List<dynamic> respuestas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    var data = await _peticionesAPI.VerActua(widget.idNivel);

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
                            Text(
                              "${respuesta['emocion']}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
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
    );
  }
}
