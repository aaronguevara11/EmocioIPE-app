import 'package:flutter/material.dart';
import 'dart:async';

class SegundaOrdenalo extends StatefulWidget {
  const SegundaOrdenalo({super.key});

  @override
  State<SegundaOrdenalo> createState() => _SegundaOrdenaloState();
}

class _SegundaOrdenaloState extends State<SegundaOrdenalo> {
  List<String> tarjetas = [
    'A. Al organizar su trabajo de esta manera, pudo reducir su ansiedad y concentrarse en completar una parte a la vez.',
    'B. Decidió aplicar la técnica de “divide y vencerás” que había aprendido en clase: desglosar el proyecto en pequeñas tareas manejables.',
    'C. Al final, logró terminar el proyecto a tiempo, sintiéndose aliviado y orgullosa de haber manejado el estrés de manera efectiva.',
    'D. Sara se encontraba abrumada por el proyecto de ciencias que debía entregar al día siguiente y no sabía por dónde empezar.',
    'E. Con el reloj marcando cada segundo, su estrés aumentaba, sintiendo que el tiempo se le escapaba de las manos.',
  ];

  final List<String> ordenCorrecto = [
    'D. Sara se encontraba abrumada por el proyecto de ciencias que debía entregar al día siguiente y no sabía por dónde empezar.',
    'E. Con el reloj marcando cada segundo, su estrés aumentaba, sintiendo que el tiempo se le escapaba de las manos.',
    'B. Decidió aplicar la técnica de “divide y vencerás” que había aprendido en clase: desglosar el proyecto en pequeñas tareas manejables.',
    'A. Al organizar su trabajo de esta manera, pudo reducir su ansiedad y concentrarse en completar una parte a la vez.',
    'C. Al final, logró terminar el proyecto a tiempo, sintiéndose aliviado y orgullosa de haber manejado el estrés de manera efectiva.',
  ];

  List<Color> colores = [
    Colors.blue,
    Colors.green,
    Color.fromARGB(255, 210, 191, 21),
    Colors.red,
    Color.fromARGB(255, 24, 7, 84),
  ];

  bool answered = false;
  int currentImageIndex = 10; // Inicialmente se muestra la imagen 10

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/modulo4/$currentImageIndex.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              ReorderableListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final String item = tarjetas.removeAt(oldIndex);
                    final Color color = colores.removeAt(oldIndex);
                    tarjetas.insert(newIndex, item);
                    colores.insert(newIndex, color);
                  });
                },
                children: List.generate(tarjetas.length, (index) {
                  return _buildCard(tarjetas[index], colores[index]);
                }),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  _onDoubleTap();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDoubleTap() {
    if (!answered) {
      setState(() {
        answered = true;
        if (tarjetas.join() == ordenCorrecto.join()) {
          currentImageIndex = 11; // Cambiar a la imagen 11
        } else {
          currentImageIndex = 12; // Cambiar a la imagen 12
          // Reorganizamos las tarjetas según el orden correcto
          tarjetas = List<String>.from(ordenCorrecto);
          colores = ordenCorrecto.map((e) => _getColorForCard(e)).toList();
        }
      });
      Future.delayed(Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FinalOrdenaView()),
        );
      });
    }
  }

  Color _getColorForCard(String card) {
    int index = ordenCorrecto.indexOf(card);
    return [
      Color.fromARGB(255, 210, 191, 21),
      Colors.red,
      Color.fromARGB(255, 24, 7, 84),
      Colors.blue,
      Colors.green,
    ][index];
  }

  Widget _buildCard(String contenido, Color colorFondo) {
    return Card(
      key: ValueKey(contenido),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorFondo,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Text(
              contenido,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FinalOrdenaView extends StatelessWidget {
  const FinalOrdenaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo4/22.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}
