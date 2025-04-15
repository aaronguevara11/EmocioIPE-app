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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                                'assets/img/modulo1/juego/titulo.jpg'),
                          ),
                          _buildQuestionBlock(
                            context,
                            image: 'assets/img/modulo1/juego/img4.jpg',
                            question: '¿Cómo sabes que emoción está sintiendo?',
                            controller: firstController,
                            imageLeft: true,
                          ),
                          _buildQuestionBlock(
                            context,
                            image: 'assets/img/modulo1/juego/img5.jpg',
                            question:
                                '¿Qué conoces sobre la emoción de la imagen?',
                            controller: secondController,
                            imageLeft: false,
                          ),
                          _buildQuestionBlock(
                            context,
                            image: 'assets/img/modulo1/juego/img6.jpg',
                            question: 'Describe la emoción de la imagen',
                            controller: thirdController,
                            imageLeft: true,
                          ),
                        ],
                      ),
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

  Widget _buildQuestionBlock(BuildContext context,
      {required String image,
      required String question,
      required TextEditingController controller,
      required bool imageLeft}) {
    final imageWidget = Container(
      margin: imageLeft
          ? const EdgeInsets.only(right: 10)
          : const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width / 3,
      child: Image.asset(image),
    );

    final questionWidget = SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 183, 15, 91),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  question,
                  style: const TextStyle(
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
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: controller,
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
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageLeft
            ? [imageWidget, questionWidget]
            : [questionWidget, imageWidget],
      ),
    );
  }
}
