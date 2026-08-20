import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';

class Barraavance extends StatelessWidget {
  const Barraavance({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      borderRadius: BorderRadius.circular(20),
      value: 0.5,
      minHeight: 8,
      backgroundColor: AppColors.datos,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.boton1),
    );
  }
}
