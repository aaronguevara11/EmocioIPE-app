import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo1/Juegos/segunda.dart';
import 'package:flutter/material.dart';

class PrimeraQUIZ extends StatefulWidget {
  const PrimeraQUIZ({super.key});

  @override
  State<PrimeraQUIZ> createState() => _PrimeraQUIZState();
}

class _PrimeraQUIZState extends State<PrimeraQUIZ> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  final PeticionesAPI _peticionesAPI = PeticionesAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset(
                              'assets/img/modulo1/juego/titulo.jpg'),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width / 3,
                                child: Image.asset(
                                    'assets/img/modulo1/juego/img1.jpg'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 183, 15, 91),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Text(
                                            '¿Como sabes que emoción esta sintiendo?',
                                            style: TextStyle(
                                              height: 0.9,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: TextFormField(
                                        controller: firstController,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Escriba una respuesta';
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 183, 15, 91),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Center(
                                          child: Text(
                                            '¿Qué conoces sobre la emoción de la imagen?',
                                            style: TextStyle(
                                              height: 0.9,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: TextFormField(
                                        controller: secondController,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Escriba una respuesta';
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width / 3,
                                child: Image.asset(
                                    'assets/img/modulo1/juego/img2.jpg'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width / 3,
                                child: Image.asset(
                                    'assets/img/modulo1/juego/img3.jpg'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 183, 15, 91),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Center(
                                          child: Text(
                                            'Describe la emoción de la imagen',
                                            style: TextStyle(
                                              height: 0.9,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: TextFormField(
                                        controller: thirdController,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Escriba una respuesta';
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              final String respuesta1 = firstController.text;
                              final String respuesta2 = secondController.text;
                              final String respuesta3 = thirdController.text;

                              final response =
                                  await (_peticionesAPI.PrimeraQuiz(
                                      respuesta1, respuesta2, respuesta3));

                              if (response == "Error") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Hubo un error'),
                                    backgroundColor:
                                        Color.fromARGB(255, 80, 17, 13),
                                  ),
                                );
                              }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SegundaQUIZ()));
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 28, 40, 81),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const Center(
                              child: Text(
                                'CONTINUAR',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 247, 240, 1.0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'PTSans',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
