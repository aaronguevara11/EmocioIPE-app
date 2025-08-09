import 'package:emocioipe/screens/start/Respuestas/Cuarto%20modulo/Actua/primeraActua.dart';
import 'package:emocioipe/screens/start/Respuestas/Cuarto%20modulo/Actua/segundaRespuestaActua.dart';
import 'package:emocioipe/screens/start/Respuestas/Cuarto%20modulo/Actua/terceraRespuestaActua.dart';
import 'package:flutter/material.dart';

class IndexActuaRespuesta extends StatefulWidget {
  const IndexActuaRespuesta({super.key});

  @override
  State<IndexActuaRespuesta> createState() => _IndexActuaRespuestaState();
}

class _IndexActuaRespuestaState extends State<IndexActuaRespuesta> {
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
            PrimeraRespuestaActua(idNivel: 1),
            SegundaRespuestaActua(idNivel: 2),
            TerceraRespuestaActua(idNivel: 3)
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
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_3_outlined),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
