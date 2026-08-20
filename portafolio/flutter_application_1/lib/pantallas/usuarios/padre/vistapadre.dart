import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/botones/barraavance.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';

class Padre extends StatefulWidget {
  final String nombre;

  const Padre({super.key, required this.nombre});

  @override
  State<Padre> createState() => _PadreState();
}

class _PadreState extends State<Padre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.base,

      appBar: AppBar(
        backgroundColor: AppColors.base,
        title: Text(
          "Inicio",
          style: TextStyles.quickSemiBold.copyWith(color: AppColors.boton1),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 10),

              // texto
              Text(
                "Buenos días, ${widget.nombre} 👋",
                style: TextStyles.quickBold.copyWith(color: AppColors.negro),
              ),

              Text(
                "Todo esta funcionando correctamente",
                style: TextStyles.quickRegularpe.copyWith(
                  color: AppColors.letramensajes,
                ),
              ),

              const SizedBox(height: 30),

              // base
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      color: AppColors.letramensajes,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // #ruta
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          "Ruta TKS-001",
                          style: TextStyles.quickRegular.copyWith(
                            color: AppColors.ruta,
                          ),
                        ),
                        //estado
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),

                          decoration: BoxDecoration(
                            color: AppColors.btncamino,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Text(
                            "• EN CAMINO",
                            style: TextStyles.quickSemiBold.copyWith(
                              color: AppColors.camino,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // conductor
                    Row(
                      children: [
                        const Icon(Icons.person_outline_rounded, size: 18),

                        const SizedBox(width: 5),

                        Text(
                          "Conductor: Mario Jiménez",
                          style: TextStyles.montSereg.copyWith(
                            color: AppColors.negro,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // AVANCE + LLEGADA ESTIMADA
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //barra
                      children: [
                        Expanded(child: Barraavance()),

                        const SizedBox(width: 15),
                        //llegada
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Text(
                              "LLEGADA EST.",
                              style: TextStyles.quickRegular.copyWith(
                                color: AppColors.letramensajes,
                                fontSize: 11,
                              ),
                            ),

                            Text(
                              "07:42 AM",
                              style: TextStyles.quickBold.copyWith(
                                color: AppColors.boton1,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
