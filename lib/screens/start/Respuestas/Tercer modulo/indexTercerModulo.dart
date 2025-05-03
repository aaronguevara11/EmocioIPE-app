import 'package:flutter/material.dart';
import 'package:emocioipe/screens/start/Respuestas/Tercer%20modulo/primeraTercerModulo.dart';
import 'package:emocioipe/screens/start/Respuestas/Tercer%20modulo/segundaTercerModulo.dart';
import 'package:emocioipe/screens/start/Respuestas/Tercer%20modulo/terceraTercerModulo.dart';
import 'package:emocioipe/screens/start/Respuestas/Tercer%20modulo/cuartaTercerModulo.dart';
import 'package:emocioipe/screens/start/Respuestas/Tercer%20modulo/quintaTercerModulo.dart';

class IndexTercerModulo extends StatefulWidget {
  const IndexTercerModulo({super.key});

  @override
  State<IndexTercerModulo> createState() => _IndexTercerModuloState();
}

class _IndexTercerModuloState extends State<IndexTercerModulo> {
  int currentPage = 0;
  final PageController pageController = PageController();

  final List<Widget> pages = [
    PrimeraTercerModulo(idNivel: 2),
    SegundaTercerModulo(idNivel: 3),
    TerceraTercerModulo(idNivel: 4),
    CuartaTercerModulo(idNivel: 5),
    QuintaTercerModulo(idNivel: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        selectedIndex: currentPage,
        onDestinationSelected: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
          setState(() {
            currentPage = index;
          });
        },
        indicatorColor: Color.fromARGB(255, 30, 30, 30),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.looks_one_outlined, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_two_outlined, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_3_outlined, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_4_outlined, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_5_outlined, color: Colors.white),
            label: '',
          ),
        ],
      ),
    );
  }
}
