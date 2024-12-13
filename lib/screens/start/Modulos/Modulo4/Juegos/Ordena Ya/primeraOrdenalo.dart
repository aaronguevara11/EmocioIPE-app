import 'package:emocioipe/screens/start/Modulos/Modulo4/Juegos/Ordena%20Ya/segunda.dart';
import 'package:flutter/material.dart';

class PrimeraOrdenalo extends StatefulWidget {
  const PrimeraOrdenalo({Key? key}) : super(key: key);

  @override
  State<PrimeraOrdenalo> createState() => _Ordenalo();
}

class _Ordenalo extends State<PrimeraOrdenalo> {
  List<String> tarjetas = [
    'Al final del día, se dio cuenta de que la pausa había sido clave para manejar su ansiedad y seguir adelante con confianza.',
    'Después de unos minutos de meditación, pudo volver a la tarea con una mente más clara y un enfoque renovado.',
    'Lucas se siente abrumado por la cantidad de tareas pendientes para la semana de exámenes.',
    'Cada vez que miraba su lista de deberes, su corazón se aceleraba y sentía un nudo en el estómago.',
    'Recordando lo que su maestra había sugerido, decidió tomar un descanso corto y respirar profundamente.',
  ];

  final List<String> ordenCorrecto = [
    'Lucas se siente abrumado por la cantidad de tareas pendientes para la semana de exámenes.',
    'Cada vez que miraba su lista de deberes, su corazón se aceleraba y sentía un nudo en el estómago.',
    'Recordando lo que su maestra había sugerido, decidió tomar un descanso corto y respirar profundamente.',
    'Después de unos minutos de meditación, pudo volver a la tarea con una mente más clara y un enfoque renovado.',
    'Al final del día, se dio cuenta de que la pausa había sido clave para manejar su ansiedad y seguir adelante con confianza.',
  ];

  List<Color> colores = [
    Colors.blue,
    Colors.green,
    Color.fromARGB(255, 210, 191, 21),
    Colors.red,
    Color.fromARGB(255, 24, 7, 84),
  ];

  bool answered = false;
  int currentImageIndex = 10; // Imagen inicial

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
          MaterialPageRoute(builder: (context) => const SegundaOrdenalo()),
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
