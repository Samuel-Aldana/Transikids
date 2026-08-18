import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class Iniciars extends StatefulWidget {
  final String texto;
  final VoidCallback funcion;

  const Iniciars({
    super.key,
    required this.texto,
    required this.funcion,
  });

  @override
  State<Iniciars> createState() => _IniciarsState();
}

class _IniciarsState extends State<Iniciars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.boton1,
          foregroundColor: AppColors.base,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: widget.funcion,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_forward,
                color: AppColors.base,
              ),
              const SizedBox(width: 10),
              Text(
                widget.texto,
                style: TextStyles.montSemiBolde,
              ),
            ],
          ),
        ),
      ),
    );
  }
}