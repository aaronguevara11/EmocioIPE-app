import 'package:emocioipe/screens/start/Modulos/modulos.dart';
import 'package:emocioipe/screens/start/Perfil/perfil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  final PageController pageController = PageController();
  bool isDocente = false;

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  // Leer la preferencia 'isDocente' desde SharedPreferences
  void _loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDocente = prefs.getBool('isDocente') ?? false;
    });
  }

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
          children: const [
            Modulos(),
            Perfil(),
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
            backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            iconSize: 32,
            selectedFontSize: 2,
            unselectedFontSize: 2,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.school),
                label: 'Módulos',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: 'Perfil',
              ),
              if (isDocente)
                const BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Docente',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
