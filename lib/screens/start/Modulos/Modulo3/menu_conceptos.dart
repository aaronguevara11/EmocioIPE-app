import 'package:flutter/material.dart';

class MenuConceptos3 extends StatefulWidget {
  const MenuConceptos3({super.key});

  @override
  State<MenuConceptos3> createState() => _MenuConceptos3State();
}

class _MenuConceptos3State extends State<MenuConceptos3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/img/modulo3/2.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Estres()),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width / 1.4,
                          height: 104,
                          child: const Card(
                            margin: EdgeInsets.all(12),
                            color: Color.fromARGB(255, 35, 11, 65),
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Estres',
                                    style: TextStyle(
                                      fontFamily: 'PTSans',
                                      fontSize: 25,
                                      height: 0.8,
                                      color: Color.fromRGBO(255, 247, 240, 1.0),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Ansiedad()),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width / 1.4,
                          height: 104,
                          child: const Card(
                            margin: EdgeInsets.all(12),
                            color: Color.fromARGB(255, 35, 11, 65),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Ansiedad',
                                  style: TextStyle(
                                    fontFamily: 'PTSans',
                                    fontSize: 25,
                                    height: 0.8,
                                    color: Color.fromRGBO(255, 247, 240, 1.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Comunicacion extends StatelessWidget {
  const Comunicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: PageView(
        children: [
          _buildImage('assets/img/modulo2/4.png', context),
          _buildImage('assets/img/modulo2/5.png', context),
          _buildImage('assets/img/modulo2/6.png', context),
          _buildImage('assets/img/modulo2/7.png', context),
          _buildImage('assets/img/modulo2/8.png', context),
          _buildImage('assets/img/modulo2/9.png', context),
          _buildImage('assets/img/modulo2/10.png', context),
        ],
      ),
    );
  }

  Widget _buildImage(String assetPath, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class Estres extends StatelessWidget {
  const Estres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: [
          _buildImage('assets/img/modulo3/3.png', context),
          _buildImage('assets/img/modulo3/4.png', context),
          _buildImage('assets/img/modulo3/5.png', context),
          _buildImage('assets/img/modulo3/6.png', context),
        ],
      ),
    );
  }

  Widget _buildImage(String assetPath, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class Ansiedad extends StatelessWidget {
  const Ansiedad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: [
          _buildImage('assets/img/modulo3/8.png', context),
          _buildImage('assets/img/modulo3/9.png', context),
          _buildImage('assets/img/modulo3/10.png', context),
          _buildImage('assets/img/modulo3/11.png', context),
        ],
      ),
    );
  }

  Widget _buildImage(String assetPath, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
