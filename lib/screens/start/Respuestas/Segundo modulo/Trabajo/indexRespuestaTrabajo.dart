import 'package:emocioipe/screens/start/Respuestas/Segundo%20modulo/Trabajo/primeraRespuestaTrabajo.dart';
import 'package:emocioipe/screens/start/Respuestas/Segundo%20modulo/Trabajo/segundaRespuestaTrabajo.dart';
import 'package:flutter/material.dart';

class IndexRespuestaTrabajo extends StatefulWidget {
  const IndexRespuestaTrabajo({super.key});

  @override
  State<IndexRespuestaTrabajo> createState() => _IndexRespuestaTrabajoState();
}

class _IndexRespuestaTrabajoState extends State<IndexRespuestaTrabajo> {
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
            PrimeraRespuestaTrabajo(idNivel: 1),
            SegundaRespuestaTrabajo(idNivel: 2)
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
