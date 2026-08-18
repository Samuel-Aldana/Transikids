import 'package:flutter_application_1/modelos/respuestalogin.dart';
import 'package:flutter_application_1/servicios/api/api.dart';
import 'package:flutter_application_1/servicios/almacenamiento/token_storage.dart';
import 'package:flutter_application_1/servicios/firestore/serviciofirestore.dart';

class ServicioAutenticacion {
  final ServicioApi api = ServicioApi();
  final TokenStorage almacenamiento = TokenStorage();
  final ServicioFirestore firestore = ServicioFirestore();

  Future<RespuestaLogin> iniciarSesion(
    String usuario,
    String contrasena,
  ) async {
    final RespuestaLogin respuesta = await api.iniciarSesion(
      usuario,
      contrasena,
    );

    // Guardar tokens
    await almacenamiento.guardarAccessToken(
      respuesta.accessToken,
    );

    await almacenamiento.guardarRefreshToken(
      respuesta.refreshToken,
    );

    // Guardar usuario en Firestore
    await firestore.guardarUsuario(respuesta);

    return respuesta;
  }

  Future<void> cerrarSesion() async {
    await almacenamiento.eliminarTokens();
  }
}