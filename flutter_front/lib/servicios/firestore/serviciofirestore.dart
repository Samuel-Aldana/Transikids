import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/modelos/respuestalogin.dart';

class ServicioFirestore {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> guardarUsuario(RespuestaLogin usuario) async {
    await firestore.collection('usuarios').doc(usuario.id.toString()).set({
      'id': usuario.id,
      'username': usuario.username,
      'proveedor': 'local',
      'fechaRegistro': FieldValue.serverTimestamp(),
    });
  }

  Future<void> guardarUsuarioGoogle({
    required String uid,
    String? nombre,
    String? correo,
    String? foto,
  }) async {
    await firestore.collection('usuarios').doc(uid).set({
      'uid': uid,
      'nombre': nombre,
      'correo': correo,
      'foto': foto,
      'proveedor': 'google',
      'fechaRegistro': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<String?> obtenerCorreoPorCedula(String cedula) async {
    // Buscar por campo 'cedula'
    final queryCedula = await firestore
        .collection('usuarios')
        .where('cedula', isEqualTo: cedula)
        .limit(1)
        .get();

    if (queryCedula.docs.isNotEmpty) {
      final data = queryCedula.docs.first.data();
      return data['correo'] as String? ?? data['email'] as String?;
    }

    // Buscar por campo 'documento'
    final queryDoc = await firestore
        .collection('usuarios')
        .where('documento', isEqualTo: cedula)
        .limit(1)
        .get();

    if (queryDoc.docs.isNotEmpty) {
      final data = queryDoc.docs.first.data();
      return data['correo'] as String? ?? data['email'] as String?;
    }

    return null;
  }

  Future<Map<String, dynamic>?> buscarUsuarioFirestore(
      String identificador) async {
    // 1. Buscar por campo 'cedula'
    var query = await firestore
        .collection('usuarios')
        .where('cedula', isEqualTo: identificador)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      return {'id': query.docs.first.id, ...query.docs.first.data()};
    }

    // 2. Buscar por campo 'documento'
    query = await firestore
        .collection('usuarios')
        .where('documento', isEqualTo: identificador)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      return {'id': query.docs.first.id, ...query.docs.first.data()};
    }

    // 3. Buscar por campo 'correo'
    query = await firestore
        .collection('usuarios')
        .where('correo', isEqualTo: identificador)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      return {'id': query.docs.first.id, ...query.docs.first.data()};
    }

    // 4. Buscar por campo 'email'
    query = await firestore
        .collection('usuarios')
        .where('email', isEqualTo: identificador)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      return {'id': query.docs.first.id, ...query.docs.first.data()};
    }

    return null;
  }
}

