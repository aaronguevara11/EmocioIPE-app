import 'package:emocioipe/screens/start/Respuestas/Cuarto%20modulo/Ordena/primeraOrdenalo.dart';
import 'package:emocioipe/screens/start/Respuestas/Cuarto%20modulo/Ordena/segundaRespuestaOrdena.dart';
import 'package:flutter/material.dart';

class IndexOrdenaRespuesta extends StatefulWidget {
  const IndexOrdenaRespuesta({super.key});

  @override
  State<IndexOrdenaRespuesta> createState() => _IndexOrdenaRespuestaState();
}

class _IndexOrdenaRespuestaState extends State<IndexOrdenaRespuesta> {
  int currentPage = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            PrimeraRespuestaOrdenalo(idNivel: 1),
            SegundaRespuestaOrdenalo(idNivel: 2),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
              setState(() {
                currentPage = index;
              });
            },
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
            iconSize: 32,
            selectedFontSize: 2,
            unselectedFontSize: 2,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_one_outlined),
                label: 'Módulos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_two_outlined),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
