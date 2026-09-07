import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';

class Barraavance extends StatelessWidget {
  // valor entre (0%) y (100%)
  final double progreso;

  const Barraavance({
    super.key,
    this.progreso = 0.0, // # por defecto
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      borderRadius: BorderRadius.circular(20),
      value: progreso.clamp(
        0.0, 1.0,), // clamp solo admite valores entre 0.0 y 1.0
      minHeight: 8,
      backgroundColor: AppColors.datos,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.boton1),
    );
  }
}
