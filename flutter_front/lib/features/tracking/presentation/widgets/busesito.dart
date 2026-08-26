import 'package:flutter/material.dart';

import 'package:flutter_application_1/bases/colores/colores.dart';

class BusMarker extends StatelessWidget {
  const BusMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.base, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.sombra,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(Icons.directions_bus, color: Colors.black87, size: 23),
    );
  }
}
