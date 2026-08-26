import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/botones/boton_primario.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class RouteStatusCard extends StatelessWidget {
  const RouteStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.base,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.sombra,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.codigo,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'RUTA EN CURSO',

                      style: TextStyles.quickBold.copyWith(
                        color: AppColors.codigo,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.letracampo,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Status: A3',
                    style: TextStyles.quickRegular.copyWith(
                      color: AppColors.letramensajes,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Text(
              'TKS-001',
              style: TextStyles.quickSemiBold.copyWith(
                color: AppColors.letramensajes,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Icon(Icons.school, color: AppColors.letramensajes, size: 16),
                const SizedBox(width: 5),
                Text(
                  'Inem',
                  style: TextStyles.quickRegular.copyWith(
                    color: AppColors.letramensajes,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            const Divider(),

            const SizedBox(height: 5),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LLEGADA APROX.',
                        maxLines: 1,
                        style: TextStyles.quickRegular.copyWith(
                          color: AppColors.letramensajes,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '8:15 a. m.',
                        style: TextStyles.quickSemiBold.copyWith(
                          color: AppColors.letramensajes,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                BotonPrimario(texto: 'Ver detalles', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
