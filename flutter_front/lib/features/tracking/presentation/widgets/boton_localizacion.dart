import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';

class LocationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LocationButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      elevation: 2.5,
      backgroundColor: AppColors.base,
      foregroundColor: AppColors.boton1,
      onPressed: onPressed,
      child: const Icon(Icons.my_location),
    );
  }
}
