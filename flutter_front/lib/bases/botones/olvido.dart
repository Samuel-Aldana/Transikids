import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class Recuperar extends StatefulWidget {
  const Recuperar({super.key});

  @override
  State<Recuperar> createState() => _RecuperarState();
}

class _RecuperarState extends State<Recuperar> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        
      },
      child: Text(
        "¿Olvidaste tu contraseña?",
        style: TextStyles.montSemiBolde.copyWith(color: AppColors.boton1),
        ),
    );
  }
}
