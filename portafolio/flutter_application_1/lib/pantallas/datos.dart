import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/botones/google.dart';
import 'package:flutter_application_1/bases/botones/ingresarcontr.dart';
import 'package:flutter_application_1/bases/botones/ingresarusu.dart';
import 'package:flutter_application_1/bases/botones/iniciars.dart';
import 'package:flutter_application_1/bases/botones/olvido.dart';
import 'package:flutter_application_1/bases/botones/recordar.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';
import 'package:flutter_application_1/bases/imagenes/google.dart';
import 'package:flutter_application_1/bases/imagenes/logo.dart';
import 'package:flutter_application_1/servicios/almacenamiento/token_storage.dart';
import 'package:flutter_application_1/servicios/autenticacion/googleautenticacion.dart';
import 'package:flutter_application_1/servicios/autenticacion/servicioautenticacion.dart';
import 'package:flutter_application_1/pantallas/usuarios/padre/vistapadre.dart';

import '../bases/imagenes/apple.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  bool recordarme = false;

  final TextEditingController usuarioController = TextEditingController();

  final TextEditingController contrasenaController = TextEditingController();

  final ServicioAutenticacion autenticacion = ServicioAutenticacion();

  final GoogleAutenticacion googleAutenticacion = GoogleAutenticacion();

  @override
  void dispose() {
    usuarioController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }

  // INICIAR SESIÓN CON USUARIO Y CONTRASEÑA
  Future<void> iniciarSesion() async {
    if (usuarioController.text.trim().isEmpty ||
        contrasenaController.text.trim().isEmpty) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por favor, ingresa tu usuario y contraseña"),
        ),
      );

      return;
    }

    try {
      final respuesta = await autenticacion.iniciarSesion(
        usuarioController.text.trim(),
        contrasenaController.text,
      );

      final almacenamiento = TokenStorage();

      // Guardar Recordarme
      await almacenamiento.guardarRecordarme(recordarme);

      // Guardar nombre
      await almacenamiento.guardarNombre(respuesta.username);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Padre(nombre: respuesta.username),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario o contraseña incorrectos")),
      );
    }
  }

  // INICIAR SESIÓN CON GOOGLE
  Future<void> iniciarSesionGoogle() async {
    try {
      final usuario = await googleAutenticacion.iniciarSesionConGoogle();

      if (usuario == null) {
        return;
      }

      final nombre = usuario.user?.displayName ?? "Usuario";

      final almacenamiento = TokenStorage();

      await almacenamiento.guardarNombre(nombre);

      await almacenamiento.guardarRecordarme(true);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Padre(nombre: nombre)),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No se pudo iniciar sesión con Google")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.base,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),

              Logo(),

              const SizedBox(height: 10),

              Text(
                "Bienvenido",
                style: TextStyles.quickBold.copyWith(color: AppColors.boton1),
              ),

              const SizedBox(height: 10),

              Text(
                "Acceso seguro al recorrido de su hijo",
                style: TextStyles.quickRegularp.copyWith(
                  color: AppColors.letramensajes,
                ),
              ),

              const SizedBox(height: 40),

              Usuario(controller: usuarioController),

              const SizedBox(height: 15),

              Contrase(controller: contrasenaController),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Recordarme(
                      texto: "Recordarme",
                      valor: recordarme,
                      funcion: (value) {
                        setState(() {
                          recordarme = value ?? false;
                        });
                      },
                    ),

                    Recuperar(texto: "Olvidé mi contraseña", funcion: () {}),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Iniciars(texto: "Iniciar sesión", funcion: iniciarSesion),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: BotonGoogle(
                        texto: "Google",
                        imagen: Imgoogle(),
                        funcion: iniciarSesionGoogle,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: BotonGoogle(
                        texto: "Apple",
                        imagen: Apple(),
                        funcion: () {},
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
