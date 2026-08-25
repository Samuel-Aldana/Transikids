import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class Registro extends StatefulWidget {
  final String texto;
  final VoidCallback funcion;

  const Registro({
    super.key,
    required this.texto,
    required this.funcion,
  });

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.base,
          minimumSize: const Size(double.infinity, 60),
          side: const BorderSide(
            color: AppColors.boton1,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: widget.funcion,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_outline,
              color: AppColors.boton1,
            ),
            const SizedBox(width: 10),
            Text(
              widget.texto,
              style: TextStyles.montSemiBolde.copyWith(
                color: AppColors.boton1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}