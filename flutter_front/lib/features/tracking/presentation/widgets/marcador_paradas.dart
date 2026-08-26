import 'package:flutter/material.dart';

import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class StopMarker extends StatelessWidget {
  final String label;
  final bool isSchool;

  const StopMarker({super.key, required this.label, this.isSchool = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.boton1,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.base, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.sombra,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: isSchool
            ? Icon(Icons.school, color: AppColors.base, size: 19)
            : Text(
                label,
                style: TextStyles.quickSemiBold.copyWith(
                  color: AppColors.base,
                  fontSize: 13,
                ),
              ),
      ),
    );
  }
}
