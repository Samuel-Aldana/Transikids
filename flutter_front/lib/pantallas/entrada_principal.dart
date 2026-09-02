import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/navegacion/app_bottom_navigation.dart';
import 'package:flutter_application_1/features/tracking/presentation/page/tracking_page.dart';
import 'package:flutter_application_1/pantallas/pantalla_temporal_uwu.dart';
import 'package:flutter_application_1/pantallas/usuarios/padre/vistapadre.dart';

class EntradaPrincipal extends StatefulWidget {
  final String nombre;

  const EntradaPrincipal({super.key, this.nombre = 'Usuario'});

  @override
  State<EntradaPrincipal> createState() => _EntradaPrincipalState();
}

class _EntradaPrincipalState extends State<EntradaPrincipal> {
  int currentIndex = 0;

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
        children: [
          Padre(nombre: widget.nombre),
          const TrackingPage(),
          const PantallaTemporal(titulo: 'Hijos'),
          const PantallaTemporal(titulo: 'Perfil'),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: currentIndex,
        onTap: cambiarPagina,
      ),
    );
  }
}
