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
}
