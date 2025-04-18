import 'package:emocioipe/screens/start/Respuestas/Primer%20modulo/primera.dart';
import 'package:emocioipe/screens/start/Respuestas/Primer%20modulo/segunda.dart';
import 'package:flutter/material.dart';

class IndexRespuesta1 extends StatefulWidget {
  const IndexRespuesta1({super.key});

  @override
  State<IndexRespuesta1> createState() => _IndexRespuesta1State();
}

class _IndexRespuesta1State extends State<IndexRespuesta1> {
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
            PrimeraRespuesta(idNivel: 1),
            SegundaRespuesta(idNivel: 2)
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
                icon: Icon(Icons.format_list_numbered_outlined),
                label: 'Módulos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_numbered_outlined),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
