import 'package:flutter/material.dart';

class AnsiedadIndex4 extends StatefulWidget {
  const AnsiedadIndex4({super.key});

  @override
  State<AnsiedadIndex4> createState() => _AnsiedadIndex4State();
}

class _AnsiedadIndex4State extends State<AnsiedadIndex4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/img/modulo4/17.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnsiedadView()));
                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    margin: const EdgeInsets.only(bottom: 40),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 28, 40, 81),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Center(
                      child: Text(
                        'INICIAR',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 247, 240, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'PTSans',
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
    );
  }
}

class AnsiedadView extends StatelessWidget {
  const AnsiedadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PageView(
            children: [
              Image.asset('assets/img/modulo4/18.jpg', fit: BoxFit.cover),
              Image.asset('assets/img/modulo4/19.jpg', fit: BoxFit.cover),
            ],
          ),
        ));
  }
}
