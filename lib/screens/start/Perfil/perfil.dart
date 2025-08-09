import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  Map<String, dynamic> datosToken = {};
  bool isLoading = false;
  String inicial = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    if (token != null) {
      try {
        final decodedToken = JwtDecoder.decode(token);
        datosToken = decodedToken;

        if (datosToken.containsKey('nombre')) {
          String name = datosToken['nombre'];
          if (name.isNotEmpty) {
            inicial = name.substring(0, 1);
            print(inicial);
          }
        }
      } catch (e) {
        print('Error');
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String dni = '';
    String nombre = '';
    String apaterno = '';
    String amaterno = '';
    String correo = '';
    String numero = '';

    if (datosToken.isNotEmpty) {
      dni = datosToken['dni'].toString();
      nombre = datosToken['nombre'];
      apaterno = datosToken['apaterno'];
      amaterno = datosToken['amaterno'];
      correo = datosToken['correo'];
      numero = datosToken['numero'].toString();
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 247, 240),
        body: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      inicial.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 90,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$nombre $apaterno',
                                      style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      'Docente',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.black54),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: GestureDetector(
                                        onTap: () async {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          await prefs.remove('token');
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginVentana()),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 143, 22, 13),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            child: Center(
                                                child: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .door_front_door_outlined,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Cerrar sesión',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  elevation: 12,
                                  shadowColor: Colors.black54,
                                  color: Color.fromARGB(255, 255, 250, 245),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Datos personales:',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Dni:',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: EdgeInsets.all(7),
                                                child: Text(
                                                  dni,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black38),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Nombres:',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: EdgeInsets.all(7),
                                                child: Text(
                                                  nombre,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black38),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Apellidos:',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: EdgeInsets.all(7),
                                                child: Text(
                                                  apaterno + ' ' + amaterno,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black38),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Correo:',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: EdgeInsets.all(7),
                                                child: Text(
                                                  correo,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black38),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Número:',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: EdgeInsets.all(7),
                                                child: Text(
                                                  numero,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black38),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )));
  }
}
