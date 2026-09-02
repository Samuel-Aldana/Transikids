import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/servicios/almacenamiento/token_storage.dart';
import 'package:flutter_application_1/servicios/firestore/serviciofirestore.dart';

class ResultadoAutenticacion {
  final String nombre;
  final String? email;
  final UserCredential? userCredential;

  ResultadoAutenticacion({
    required this.nombre,
    this.email,
    this.userCredential,
  });
}

class ServicioAutenticacion {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TokenStorage almacenamiento = TokenStorage();
  final ServicioFirestore firestore = ServicioFirestore();

  Future<ResultadoAutenticacion> iniciarSesion(
    String identificador,
    String contrasena,
  ) async {
    final idLimpio = identificador.trim();

    // 1. Validar si el usuario está registrado directamente en Firestore (colección 'usuarios')
    final usuarioFirestore = await firestore.buscarUsuarioFirestore(idLimpio);

    if (usuarioFirestore != null) {
      final passwordGuardado = usuarioFirestore['password'] as String?;

      if (passwordGuardado == contrasena) {
        final nombre = usuarioFirestore['nombre'] as String? ?? idLimpio;
        await almacenamiento.guardarAccessToken('firestore_session_${usuarioFirestore['id']}');
        await almacenamiento.guardarNombre(nombre);

        return ResultadoAutenticacion(
          nombre: nombre,
          email: usuarioFirestore['correo'] as String? ?? usuarioFirestore['email'] as String?,
        );
      } else {
        throw FirebaseAuthException(
          code: 'wrong-password',
          message: 'La contraseña ingresada no es correcta.',
        );
      }
    }

    // 2. Si no se encontró en la colección con password local, intentar con Firebase Authentication
    String email = idLimpio;
    if (!email.contains('@')) {
      final correoEncontrado = await firestore.obtenerCorreoPorCedula(email);
      if (correoEncontrado != null && correoEncontrado.isNotEmpty) {
        email = correoEncontrado;
      } else {
        email = '$email@transikids.com';
      }
    }

    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: contrasena,
    );

    final user = userCredential.user;
    final nombre = user?.displayName ?? user?.email?.split('@').first ?? idLimpio;

    if (user != null) {
      final token = await user.getIdToken();
      if (token != null) {
        await almacenamiento.guardarAccessToken(token);
      }
      await almacenamiento.guardarNombre(nombre);
    }

    return ResultadoAutenticacion(
      nombre: nombre,
      email: user?.email,
      userCredential: userCredential,
    );
  }

  Future<void> cerrarSesion() async {
    try {
      await _auth.signOut();
    } catch (_) {}
    await almacenamiento.eliminarTokens();
  }
}