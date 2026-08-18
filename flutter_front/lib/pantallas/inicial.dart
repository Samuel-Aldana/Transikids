import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/botones/iniciars.dart';
import 'package:flutter_application_1/bases/botones/olvido.dart';
import 'package:flutter_application_1/bases/botones/registro.dart';
import 'package:flutter_application_1/bases/imagenes/ciudad.dart';
import 'package:flutter_application_1/bases/imagenes/logo.dart';

class Inicial extends StatefulWidget {
  const Inicial({super.key});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        SizedBox(height: 60),
        Logo(),
        Ciudad(),
        SizedBox(height: 90),
        Iniciars(), 
        SizedBox(height: 20),
        Registro(),
        SizedBox(height: 10),
        Recuperar(),
        Spacer(), 
        
      ],
      
    );
  }
}