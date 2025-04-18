import 'package:flutter/material.dart';
import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo4/Juegos/Ordena%20Ya/segunda.dart';

class PrimeraOrdenalo extends StatefulWidget {
  const PrimeraOrdenalo({Key? key}) : super(key: key);

  @override
  State<PrimeraOrdenalo> createState() => _OrdenaloState();
}

class _OrdenaloState extends State<PrimeraOrdenalo> {
  final PeticionesAPI _peticionesAPI = PeticionesAPI();

  final List<String> tarjetasIniciales = [
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

  late List<String> tarjetas;
  late List<Color> colores;

  bool answered = false;
  int currentImageIndex = 10;

  @override
  void initState() {
    super.initState();
    tarjetas = List.from(tarjetasIniciales);
    colores = [
      Colors.blue,
      Colors.green,
      const Color.fromARGB(255, 210, 191, 21),
      Colors.red,
      const Color.fromARGB(255, 24, 7, 84),
    ];
  }

  Future<void> _onSend() async {
    if (answered) return;
    setState(() {
      answered = true;
      if (tarjetas.join() == ordenCorrecto.join()) {
        currentImageIndex = 11;
      } else {
        currentImageIndex = 12;
        tarjetas = List.from(ordenCorrecto);
        colores = ordenCorrecto.map(_getColorForCard).toList();
      }
    });

    final resultado = await _peticionesAPI.OrdenaloEnviar(
      1,
      tarjetas[0],
      tarjetas[1],
      tarjetas[2],
      tarjetas[3],
      tarjetas[4],
    );

    if (resultado == 'Error') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al enviar el orden.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Orden enviado correctamente.'),
          backgroundColor: Colors.green,
        ),
      );
    }

    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SegundaOrdenalo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/img/modulo4/$currentImageIndex.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 5,
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex--;
                    final item = tarjetas.removeAt(oldIndex);
                    final col = colores.removeAt(oldIndex);
                    tarjetas.insert(newIndex, item);
                    colores.insert(newIndex, col);
                  });
                },
                children: List.generate(
                  tarjetas.length,
                  (index) => _buildCard(tarjetas[index], colores[index]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton.icon(
                onPressed: _onSend,
                icon: const Icon(Icons.send_outlined),
                label: const Text('Enviar orden'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForCard(String texto) {
    final idx = ordenCorrecto.indexOf(texto);
    return [
      const Color.fromARGB(255, 210, 191, 21),
      Colors.red,
      const Color.fromARGB(255, 24, 7, 84),
      Colors.blue,
      Colors.green,
    ][idx];
  }

  Widget _buildCard(String contenido, Color color) {
    return Card(
      key: ValueKey(contenido),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(
          contenido,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
