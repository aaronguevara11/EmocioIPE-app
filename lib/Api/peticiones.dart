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

  Future<Object> PrimeraQuiz(respuesta1, respuesta2, respuesta3) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/emotiquiz/enviarRespuesta',
        data: {
          'idNivel': 1,
          'respuesta1': respuesta1,
          'respuesta2': respuesta2,
          'respuesta3': respuesta3,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> SegundaQuiz(respuesta1, respuesta2, respuesta3) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/emotiquiz/enviarRespuesta',
        data: {
          'idNivel': 2,
          'respuesta1': respuesta1,
          'respuesta2': respuesta2,
          'respuesta3': respuesta3,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> ComunicacionEnviar(respuesta) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/comunicacion/enviarRespuesta',
        data: {
          'idNivel': 1,
          'respuesta': respuesta,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> ComunicacionEnviar2(respuesta) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/comunicacion/enviarRespuesta',
        data: {
          'idNivel': 2,
          'respuesta': respuesta,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> TrabajoEnviar(respuesta) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/trabajo/enviarRespuesta',
        data: {
          'idNivel': 1,
          'respuesta': respuesta,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> TrabajoEnviar2(respuesta) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/trabajo/enviarRespuesta',
        data: {
          'idNivel': 2,
          'respuesta': respuesta,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> LiderazgoEnviar(respuesta) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/liderazgo/enviarRespuesta',
        data: {
          'idNivel': 1,
          'respuesta': respuesta,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> LiderazgoEnviar2(respuesta) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/liderazgo/enviarRespuesta',
        data: {
          'idNivel': 2,
          'respuesta': respuesta,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> ResolucionEnviar(idNivel, respuesta) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/resolucion/enviarRespuesta',
        data: {
          'idNivel': idNivel,
          'respuesta': respuesta,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> ActuaEnviar(idNivel, emocion, respuesta) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/actua/enviarRespuesta',
        data: {
          'idNivel': idNivel,
          'emocion': emocion,
          'respuesta': respuesta,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<Object> OrdenaloEnviar(
      idNivel, orden1, orden2, orden3, orden4, orden5) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.post(
        'https://emocioipe.onrender.com/app/ordenalo/enviarRespuesta',
        data: {
          'idNivel': idNivel,
          'orden1': orden1,
          'orden2': orden2,
          'orden3': orden3,
          'orden4': orden4,
          'orden5': orden5,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data.toString();

      if (result == "Error") {
        return "Error";
      }
      print("Enviado correctamente");
    } on DioException catch (e) {
      print(e);
    }
    return "";
  }

  Future<List<Map<String, dynamic>>> VerPrimeraQuiz(int idNivel) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.get(
        'https://emocioipe.onrender.com/app/emotiquiz/verRespuesta',
        data: {
          'idNivel': idNivel,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data['respuestas'] as List;
      return result.map((e) => e as Map<String, dynamic>).toList();
    } on DioException catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> VerComunicacion(int idNivel) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.get(
        'https://emocioipe.onrender.com/app/comunicacion/verRespuesta',
        data: {
          'idNivel': idNivel,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data['respuestas'] as List;
      return result.map((e) => e as Map<String, dynamic>).toList();
    } on DioException catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> VerTrabajo(int idNivel) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.get(
        'https://emocioipe.onrender.com/app/trabajo/verRespuesta',
        data: {
          'idNivel': idNivel,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data['respuestas'] as List;
      return result.map((e) => e as Map<String, dynamic>).toList();
    } on DioException catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> VerLiderazgo(int idNivel) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.get(
        'https://emocioipe.onrender.com/app/liderazgo/verRespuesta',
        data: {
          'idNivel': idNivel,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data['respuestas'] as List;
      return result.map((e) => e as Map<String, dynamic>).toList();
    } on DioException catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> VerResolucion(int idNivel) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.get(
        'https://emocioipe.onrender.com/app/resolucion/verRespuesta',
        data: {
          'idNivel': idNivel,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data['respuestas'] as List;
      return result.map((e) => e as Map<String, dynamic>).toList();
    } on DioException catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> VerModulo3(int idNivel) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await dio.get(
        'https://emocioipe.onrender.com/app/modulo3/verRespuesta',
        data: {
          'idNivel': idNivel,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      var result = response.data['respuestas'] as List;
      return result.map((e) => e as Map<String, dynamic>).toList();
    } on DioException catch (e) {
      print(e);
    }
    return [];
  }
}
