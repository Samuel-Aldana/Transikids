import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class BotonGoogle extends StatelessWidget {
  final String texto;
  final String imagen;
  final VoidCallback funcion;

  const BotonGoogle({
    super.key,
    required this.texto,
    required this.imagen,
    required this.funcion,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 60,
      child: OutlinedButton(
        onPressed: funcion,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.base,
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagen, width: 24, height: 24),
            const SizedBox(width: 8),
            Text(texto, style: TextStyles.montSemiBolde),
          ],
        ),
      ),
    );
  }
}
