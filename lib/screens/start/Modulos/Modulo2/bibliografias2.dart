import 'package:flutter/material.dart';

class Bibliografias2 extends StatefulWidget {
  const Bibliografias2({super.key});

  @override
  State<Bibliografias2> createState() => _Bibliografias2State();
}

class _Bibliografias2State extends State<Bibliografias2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 240, 1.0),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bibliografias'.toUpperCase(),
                  style: TextStyle(fontSize: 35, fontFamily: "AlfaSlabOne"),
                ),
                const SizedBox(
                  height: 3,
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
                            'Benavente, P, y Rivas, N. (2022). ¿Qué es la comunicación asertiva?. ITA. https://itasaludmental.com/blog/link/350# ',
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
                            'Cruz, C. (2018). La argumentación en los procesos de resolución de conflictos escolares. Prospectiva, 25, 141-162. https://www.redalyc.org/jatsRepo/5742/574261763006/574261763006.pdf',
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
                            'Gabarda, V. (2018). Resolución de conflictos en el aula. Conceptos, áreas de conflicto y técnicas de resolución. Universidad Internacional de Valencia. https://docenteslibresmdq.files.wordpress.com/2018/05/283-viu_resolucionconflictos_1.pdf',
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
                            'González, M. (2021). La comunicación asertiva, una habilidad fundamental para el convivir. Universidad Central. https://www.ucentral.edu.co/noticentral/comunicacion-asertiva',
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
                            'Grupo Geard (2022). ¿Cómo potenciar el liderazgo estudiantil en los alumnos? https://grupogeard.com/pe/blog/categoria/potenciar-liderazgo-estudiantil-alumnos/',
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
                            'Locke et al. (2002).  Building a Practically Useful Theory of Goal Setting and Task Motivation: A 35 Year Odyssey. American Psychologist. DOI: 10.1037/0003-066X.57.9.705',
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
                            'Marzano et al. (2010). Dimensiones del aprendizaje. Manual para el maestro. Iteso https://acortar.link/sOwBBc',
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
                            'Moreno, T. (2021). La Retroalimentación. Un proceso clave para la enseñanza y la evaluación formativa. Universidad Autónoma Metropolitana http://dccd.cua.uam.mx/libros/investigacion/Retroalimentacion.pdf',
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
                            'Ríos, R. (2023). Resolución de Conflictos en el Aula de Clases: Estrategias y Enfoques Pedagógicos. Escuela de profesores del Perú. https://epperu.org/resolucion-de-conflictos-en-el-aula-de-clases-estrategias-y-enfoques-pedagogicos/',
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
                            'Sánchez et al. (2015). Percepciones sobre el liderazgo. Ra Ximhai, 11(4), 161-170. https://www.redalyc.org/articulo.oa?id=46142596010',
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
                            'Scholastica (2022). 9 consejos para impulsar el liderazgo en adolescentes. https://scholasticaprep.com/blogs/adolescentes/9-consejos-para-impulsar-el-liderazgo-en-adolescentes',
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
