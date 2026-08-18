import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class Contrase extends StatefulWidget {
  const Contrase({super.key});

  @override
  State<Contrase> createState() => _ContraseState();
}

class _ContraseState extends State<Contrase> {
  bool ocultar = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contraseña",
            style: TextStyles.montSemiBolde,
          ),

          const SizedBox(height: 5),

          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: TextField(
              obscureText: ocultar,
              obscuringCharacter: '*',

              decoration: InputDecoration(
                hintText: "Ingrese su contraseña",
                hintStyle: TextStyles.quickRegularcambiante,

                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppColors.negro,
                  size: 20,
                ),

                suffixIcon: IconButton(
                  icon: Icon(
                    ocultar
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.negro,
                  ),
                  onPressed: () {
                    setState(() {
                      ocultar = !ocultar;
                    });
                  },
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