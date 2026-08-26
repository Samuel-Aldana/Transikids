import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';

class BotonPrimario extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color? colorFondo;

  const BotonPrimario({
    super.key,
    required this.texto,
    required this.onPressed,
    this.colorFondo,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 44),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        backgroundColor: colorFondo ?? AppColors.boton1,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: onPressed,
      child: Text(texto, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
