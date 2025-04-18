import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo4/index.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SegundaOrdenalo extends StatefulWidget {
  const SegundaOrdenalo({super.key});

  @override
  State<SegundaOrdenalo> createState() => _SegundaOrdenaloState();
}

class _SegundaOrdenaloState extends State<SegundaOrdenalo> {
  PeticionesAPI _peticionesAPI = PeticionesAPI();

  List<String> tarjetasIniciales = [
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

  late List<String> tarjetas;
  late List<Color> colores;

  bool answered = false;
  int currentImageIndex = 10;

  @override
  void initState() {
    super.initState();
    tarjetas = List.from(tarjetasIniciales);
    colores = tarjetas.map(_getColorForCard).toList();
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
      2,
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
        builder: (context) => const FinalOrdenaView(),
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
    ][idx % 5];
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

class FinalOrdenaView extends StatelessWidget {
  const FinalOrdenaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const IndexModulo4()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: PageView(
            children: [
              Image.asset(
                'assets/img/modulo4/22.jpg',
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
