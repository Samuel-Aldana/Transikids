import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class Recuperar extends StatefulWidget {
  final String texto;
  final VoidCallback funcion;

  const Recuperar({super.key, required this.texto, required this.funcion});

  @override
  State<Recuperar> createState() => _RecuperarState();
}

class _RecuperarState extends State<Recuperar> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.funcion,
      child: Text(
        widget.texto,
        style: TextStyles.montSemiBolde.copyWith(color: AppColors.boton1),
      ),
    );
  }
}
