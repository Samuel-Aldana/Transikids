import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> guardarAccessToken(String token) async {
    await storage.write(key: 'access_token', value: token);
  }

  Future<void> guardarRefreshToken(String token) async {
    await storage.write(key: 'refresh_token', value: token);
  }

  Future<String?> obtenerAccessToken() async {
    return await storage.read(key: 'access_token');
  }

  Future<String?> obtenerRefreshToken() async {
    return await storage.read(key: 'refresh_token');
  }

  Future<void> guardarRecordarme(bool valor) async {
    await storage.write(key: 'recordarme', value: valor.toString());
  }

  Future<bool> obtenerRecordarme() async {
    final valor = await storage.read(key: 'recordarme');

    return valor == 'true';
  }

  Future<void> guardarNombre(String nombre) async {
    await storage.write(key: 'nombre', value: nombre);
  }

  Future<String?> obtenerNombre() async {
    return await storage.read(key: 'nombre');
  }

  Future<void> eliminarTokens() async {
    await storage.delete(key: 'access_token');

    await storage.delete(key: 'refresh_token');

    await storage.delete(key: 'recordarme');

    await storage.delete(key: 'nombre');
  }
}
