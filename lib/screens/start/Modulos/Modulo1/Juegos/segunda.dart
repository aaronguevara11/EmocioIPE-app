import 'package:flutter/material.dart';

class SegundaQUIZ extends StatefulWidget {
  const SegundaQUIZ({super.key});

  @override
  State<SegundaQUIZ> createState() => _SegundaQUIZState();
}

class _SegundaQUIZState extends State<SegundaQUIZ> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/img/modulo1/juego/titulo.jpg'),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width / 3 + 25,
                          child:
                              Image.asset('assets/img/modulo1/juego/img4.jpg'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 183, 15, 91),
                                    borderRadius: BorderRadius.circular(10)),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                    margin: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 183, 15, 91),
                                    borderRadius: BorderRadius.circular(10)),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width / 3 + 25,
                          child:
                              Image.asset('assets/img/modulo1/juego/img5.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width / 3 + 25,
                          child:
                              Image.asset('assets/img/modulo1/juego/img6.jpg'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 183, 15, 91),
                                    borderRadius: BorderRadius.circular(10)),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
