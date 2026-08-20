import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class Usuario extends StatelessWidget {
  final TextEditingController controller;

  const Usuario({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cédula de ciudadanía", style: TextStyles.montSemiBolde),
          const SizedBox(height: 5),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Ingrese su usuario",
                hintStyle: TextStyles.quickRegularcambiante,
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: AppColors.negro,
                  size: 20,
                ),
                filled: true,
                fillColor: AppColors.letracampo,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}