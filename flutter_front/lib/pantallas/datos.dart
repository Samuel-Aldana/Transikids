import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/botones/ingresarcontr.dart';
import 'package:flutter_application_1/bases/botones/ingresarusu.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';
import 'package:flutter_application_1/bases/imagenes/logo.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  @override
  Widget build(BuildContext context)
       {
    return Scaffold(
      backgroundColor: AppColors.base,
      body: Column(
      children: [
        SizedBox(height: 60),
        Logo(),
        const SizedBox(height: 10),
        Text(
          "Bienvenido",
          style: TextStyles.quickBold.copyWith(color: AppColors.boton1,decoration: TextDecoration.none,),
        ),
        const SizedBox(height: 10),
        Text(
          "Acceso seguro al recorrido de su hijo",
          style: TextStyles.quickRegularp.copyWith(color: AppColors.letramensajes,decoration: TextDecoration.none,),
        ),
        SizedBox(height: 40),
        Usuario(),
        SizedBox(height: 15),
        Contrase(),

      ],
      )      
    );
  }
}
