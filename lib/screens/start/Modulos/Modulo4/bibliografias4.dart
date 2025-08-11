import 'package:flutter/material.dart';

class Bibliografias4 extends StatefulWidget {
  const Bibliografias4({super.key});

  @override
  State<Bibliografias4> createState() => _Bibliografias4State();
}

class _Bibliografias4State extends State<Bibliografias4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 40, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bibliografias'.toUpperCase(),
                style: TextStyle(fontSize: 35, fontFamily: "AlfaSlabOne"),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ríos, R. (2023). Resolución de Conflictos en el Aula de Clases: Estrategias y Enfoques Pedagógicos. Escuelas de profesores del Perú. https://epperu.org/resolucion-de-conflictos-en-el-aula-de-clases-estrategias-y-enfoques-pedagogicos/',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cruz-Romero, C.,  (2018). La argumentación en los procesos de resolución de conflictos escolares. PROSPECTIVA. Revista de Trabajo Social e intervención social,  (25), 141-162. https://doi.org/10.25100/prts.v0i25.5957',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Gabarda, V. (2018).  Resolución de conflictos en el aula. Concepto, áreas de conflictos y técnicas de resolución. Universidad Internacional de Valencia. https://docenteslibresmdq.files.wordpress.com/2018/05/283-viu_resolucionconflictos_1.pdf',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SCHOLASTICA. (2022). 9 consejos para impulsar el liderazgo en adolescentes. https://scholasticaprep.com/blogs/adolescentes/9-consejos-para-impulsar-el-liderazgo-en-adolescentes',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Grupo Geard (2022). ¿Cómo potenciar el liderazgo estudiantil en los alumnos?. https://grupogeard.com/pe/blog/categoria/potenciar-liderazgo-estudiantil-alumnos/',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sánchez-Reyes, J. B., y Barraza-Barraza, L.  (2015). PERCEPCIONES SOBRE LIDERAZGO. Ra Ximhai, 11(4), 161-170. https://www.redalyc.org/articulo.oa?id=46142596010',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Locke, E. A., & Latham, G. P. (2002). Building a practically useful theory of goal setting and task motivation: A 35-year odyssey. American Psychologist, 57(9), 705-717. https://doi.org/10.1037/0003-066x.57.9.705',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Moreno, T. (2021). La retroalimentación : un proceso clave para la enseñanza y la evaluación formativa. http://ilitia.cua.uam.mx:8080/jspui/handle/123456789/958',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Card(
                  color: Color.fromRGBO(255, 250, 240, 1),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Marzano, R. J., Pickering, D. J., Arredondo, D., Blackburn, G., Brandt, R., Moffett, C., ... & de Gutiérrez, H. (2005). Dimensiones del aprendizaje: manual para el maestro ITESO. Guadalajara: ITESO. https://acortar.link/sOwBBc',
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
