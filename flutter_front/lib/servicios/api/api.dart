import 'package:dio/dio.dart';
import 'package:flutter_application_1/modelos/respuestalogin.dart';

class ServicioApi {
  final Dio dio = Dio();

  ServicioApi() {
    dio.options.baseUrl = 'https://dummyjson.com';
  }

  Future<RespuestaLogin> iniciarSesion(
    String usuario,
    String contrasena,
  ) async {
    final Response respuesta = await dio.post(
      '/auth/login',
      data: {
        'username': usuario,
        'password': contrasena,
        'expiresInMins': 5,
      },
    );

    return RespuestaLogin.fromJson(respuesta.data);
  }
}