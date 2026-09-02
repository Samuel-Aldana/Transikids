import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'bases/colores/colores.dart';
import 'firebase_options.dart';
import 'pantallas/entrada_principal.dart';
import 'pantallas/inicial.dart';
import 'pantallas/entrada_principal.dart';
import 'servicios/almacenamiento/token_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<String?> verificarSesion() async {
    final almacenamiento = TokenStorage();

    final recordarme = await almacenamiento.obtenerRecordarme();
    final accessToken = await almacenamiento.obtenerAccessToken();

    if (recordarme && accessToken != null) {
      return await almacenamiento.obtenerNombre();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
        future: verificarSesion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: AppColors.base,
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data != null) {
            return EntradaPrincipal(nombre: snapshot.data!);
          }

          return const Scaffold(
            backgroundColor: AppColors.base,
            body: Inicial(),
          );
        },
      ),
    );
  }
}
