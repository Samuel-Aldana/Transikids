import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class Recordarme extends StatefulWidget {
  final String texto;
  final bool valor;
  final ValueChanged<bool?> funcion;

  const Recordarme({
    super.key,
    required this.texto,
    required this.valor,
    required this.funcion,
  });

  @override
  State<Recordarme> createState() => _RecordarmeState();
}

class _RecordarmeState extends State<Recordarme> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: widget.valor,
          onChanged: widget.funcion,
          activeColor: AppColors.boton1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Text(
          widget.texto,
          style: TextStyles.montSemiBolde.copyWith(color: AppColors.boton1),
        ),
      ],
    );
  }
}
