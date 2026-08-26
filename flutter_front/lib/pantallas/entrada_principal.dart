import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/tracking/presentation/page/tracking_page.dart';
import 'package:flutter_application_1/bases/navegacion/app_bottom_navigation.dart';
import 'package:flutter_application_1/pantallas/pantalla_temporal_uwu.dart';

class EntradaPrincipal extends StatefulWidget {
  const EntradaPrincipal({super.key});

  @override
  State<EntradaPrincipal> createState() => _EntradaPrincipalState();
}

class _EntradaPrincipalState extends State<EntradaPrincipal> {
  int currentIndex = 1;

  void cambiarPagina(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          PantallaTemporal(titulo: 'Inicio'),
          TrackingPage(),
          PantallaTemporal(titulo: 'Hijos'),
          PantallaTemporal(titulo: 'Perfil'),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: currentIndex,
        onTap: cambiarPagina,
      ),
    );
  }
}
