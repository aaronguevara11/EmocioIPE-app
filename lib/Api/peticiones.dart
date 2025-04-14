import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const backend = "https://emocioipe.onrender.com/app";

class PeticionesAPI {
  final dio = Dio();
  Future<Object> LoginDocente(correo, password) async {
    try {
      final response = await dio.put(
        'https://emocioipe.onrender.com/app/loginDocentes',
        data: {'correo': correo, 'password': password},
      );
      var result = response.data.toString();

      String message = response.data['message'];
      print(response);
      print(message);

      if (result == "{message: Datos incorrectos}") {
        return "Datos incorrectos";
      } else if (response.statusCode == 500) {
        return "Error en el servidor";
      } else {
        final token = response.data['token'];
        print(token);

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt', token);
        return token;
      }
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> LoginEstudiante(String correo, String password) async {
    try {
      final response = await dio.put(
        'https://emocioipe.onrender.com/app/loginAlumnos',
        data: {'correo': correo, 'password': password},
      );

      var result = response.data.toString();

      String message = response.data['message'];
      print(response);
      print(message);

      if (result == "{message: Datos incorrectos}") {
        return "Datos incorrectos";
      } else if (response.statusCode == 500) {
        return "Error en el servidor";
      } else {
        final token = response.data['token'];
        print(token);

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt', token);
        return token;
      }
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> RegistrarDocente(
      dni, nombre, apaterno, amaterno, numero, correo, password) async {
    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/registrarDocentes',
        data: {
          'nombre': nombre,
          'apaterno': apaterno,
          'amaterno': amaterno,
          'correo': correo,
          'dni': dni,
          'password': password
        },
      );
      var result = response.data.toString();

      if (result == "{message: Datos incorrectos}") {
        return "Datos incorrectos";
      } else if (response.statusCode == 500) {
        return "Error en el servidor";
      } else {
        final token = response.data['token'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        return token;
      }
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> RegistrarEstudiante(
      dni, nombre, apaterno, amaterno, numero, correo, password) async {
    try {
      final response = await dio.put(
        'https://emocioipe.onrender.com/app/registrarAlumnos',
        data: {
          'nombre': nombre,
          'apaterno': apaterno,
          'amaterno': amaterno,
          'correo': correo,
          'dni': dni,
          'password': password
        },
      );
      var result = response.data.toString();

      if (result == "{message: Datos incorrectos}") {
        return "Datos incorrectos";
      } else if (response.statusCode == 500) {
        return "Error en el servidor";
      } else {
        final token = response.data['token'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        return token;
      }
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }
}
