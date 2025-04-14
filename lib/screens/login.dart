import 'package:emocioipe/Api/peticiones.dart';
import 'package:emocioipe/screens/registro.dart';
import 'package:emocioipe/screens/start/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginVentana extends StatefulWidget {
  const LoginVentana({super.key});

  @override
  State<LoginVentana> createState() => _Login();
}

class _Login extends State<LoginVentana> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final PeticionesAPI _peticionesAPI = PeticionesAPI();
  bool isDocente = false;
  bool isLoading = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 35),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/img/Login.png',
                width: 320,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 28, 40, 81),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 32, right: 32, bottom: 26),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Acceder'.toUpperCase(),
                          style: GoogleFonts.robotoSlab(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 43,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: correoController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Correo',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su correo electrónico';
                            } else if (!value.contains('@')) {
                              return 'Ingrese un correo válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(
                              Icons.password_outlined,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Escriba su contraseña';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              activeColor: Colors.white,
                              checkColor: Colors.black,
                              value: isDocente,
                              onChanged: (value) {
                                setState(() {
                                  isDocente = value!;
                                });
                              },
                            ),
                            const Text(
                              "Soy Docente",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              final String correo = correoController.text;
                              final String password = passwordController.text;

                              final response = await (isDocente
                                  ? _peticionesAPI.LoginDocente(
                                      correo, password)
                                  : _peticionesAPI.LoginEstudiante(
                                      correo, password));

                              setState(() {
                                isLoading = false;
                              });

                              if (response == "Datos incorrectos") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Datos incorrectos'),
                                    backgroundColor:
                                        Color.fromARGB(255, 80, 17, 13),
                                  ),
                                );
                              } else if (response == "Error en el servidor" ||
                                  response == "Token no recibido" ||
                                  response ==
                                      "Respuesta no válida del servidor" ||
                                  response == "Error inesperado") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Error al iniciar sesión, verifique sus credenciales'),
                                    backgroundColor:
                                        Color.fromARGB(255, 113, 32, 26),
                                  ),
                                );
                              } else {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('isDocente', isDocente);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 149, 11, 73),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Acceder',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistroIndex()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: Colors.white,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Registrate aquí",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
