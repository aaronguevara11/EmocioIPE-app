import 'package:emocioipe/screens/start/Modulos/Modulo1/Juegos/primera.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo1/Juegos/segunda.dart';
import 'package:emocioipe/screens/start/Modulos/Modulo1/index.dart';
import 'package:flutter/material.dart';

class EmotiQuiz extends StatefulWidget {
  const EmotiQuiz({super.key});

  @override
  State<EmotiQuiz> createState() => _EmotiQuizState();
}

class _EmotiQuizState extends State<EmotiQuiz> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });

            if (page == 2) {
              Future.delayed(const Duration(milliseconds: 300), () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              });
            }
          },
          children: [
            const PrimeraQUIZ(),
            const SegundaQUIZ(),
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Modulo1(),
                    ),
                  );
                }
              },
              child: Image.asset(
                'assets/img/modulo1/juego/51.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
