import 'package:emocioipe/screens/start/Respuestas/Segundo%20modulo/Comunicacion/primeraRespuestaComunicacion.dart';
import 'package:emocioipe/screens/start/Respuestas/Segundo%20modulo/Comunicacion/segundaRespuestaComunicacion.dart';
import 'package:emocioipe/screens/start/Respuestas/Segundo%20modulo/Liderazgo/primeraLiderazgo.dart';
import 'package:emocioipe/screens/start/Respuestas/Segundo%20modulo/Liderazgo/segundaLiderazgo.dart';
import 'package:flutter/material.dart';

class IndexRespuestaLiderazgo extends StatefulWidget {
  const IndexRespuestaLiderazgo({super.key});

  @override
  State<IndexRespuestaLiderazgo> createState() =>
      _IndexRespuestaLiderazgoState();
}

class _IndexRespuestaLiderazgoState extends State<IndexRespuestaLiderazgo> {
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
            PrimeraLiderazgo(idNivel: 1),
            SegundaLiderazgo(idNivel: 2)
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
