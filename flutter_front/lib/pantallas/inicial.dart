import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/botones/iniciars.dart';
import 'package:flutter_application_1/bases/botones/olvido.dart';
import 'package:flutter_application_1/bases/botones/registro.dart';
import 'package:flutter_application_1/bases/imagenes/ciudad.dart';
import 'package:flutter_application_1/bases/imagenes/logo.dart';
import 'package:flutter_application_1/pantallas/datos.dart';

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
        const SizedBox(height: 60),
        const Logo(),
        const Ciudad(),
        const SizedBox(height: 90),

        Iniciars(
          texto: "Iniciar sesión",
          funcion: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Datos(),
              ),
            );
          },
        ),

        const SizedBox(height: 20),

        Registro(
          texto: "registrarse",
          funcion: () {},
        ),

        const SizedBox(height: 10),

        Recuperar(
          texto: "¿olvidaste tu contraseña?",
          funcion: () {},
        ),

        const Spacer(),
      ],
    );
  }
}
