import 'package:emocioipe/Api/peticiones.dart';
import 'package:flutter/material.dart';

class PrimeraRespuestaOrdenalo extends StatefulWidget {
  final int idNivel;
  const PrimeraRespuestaOrdenalo({super.key, required this.idNivel});

  @override
  State<PrimeraRespuestaOrdenalo> createState() =>
      _PrimeraRespuestaOrdenaloState();
}

class _PrimeraRespuestaOrdenaloState extends State<PrimeraRespuestaOrdenalo> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  List<dynamic> respuestas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    var data = await _peticionesAPI.VerOrdenalo(widget.idNivel);

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
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '1°: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${respuesta['orden1']}",
                                      style: const TextStyle(fontSize: 14),
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '2°: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${respuesta['orden2']}",
                                      style: const TextStyle(fontSize: 14),
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '3°: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${respuesta['orden3']}",
                                      style: const TextStyle(fontSize: 14),
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '4°: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${respuesta['orden4']}",
                                      style: const TextStyle(fontSize: 14),
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '5°: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${respuesta['orden5']}",
                                      style: const TextStyle(fontSize: 14),
                                      softWrap: true,
                                    ),
                                  ),
                                ],
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
