import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class BotonGoogle extends StatelessWidget {
  final String texto;
  final Widget imagen;
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
      width: 220,
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
            SizedBox(width: 24, height: 24, child: imagen),
            const SizedBox(width: 10),
            Text(texto, style: TextStyles.montSemiBolde),
          ],
        ),
      ),
    );
  }
}
