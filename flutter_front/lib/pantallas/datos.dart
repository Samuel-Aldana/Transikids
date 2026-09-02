import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:flutter_application_1/pantallas/entrada_principal.dart';

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

  void _irAEntradaPrincipal(String nombre) {
    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => EntradaPrincipal(nombre: nombre),
      ),
      (route) => false,
    );
  }

  Future<void> _guardarSesionFirebase(User user, String nombre) async {
    final token = await user.getIdToken();
    final almacenamiento = TokenStorage();

    if (token != null) {
      await almacenamiento.guardarAccessToken(token);
    }
    await almacenamiento.guardarNombre(nombre);
  }

  @override
  void dispose() {
    usuarioController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }

  // INICIAR SESIÓN CON USUARIO (CÉDULA / CORREO) Y CONTRASEÑA
  Future<void> iniciarSesion() async {
    final identificador = usuarioController.text.trim();
    final contrasena = contrasenaController.text;

    if (identificador.isEmpty || contrasena.isEmpty) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por favor, ingresa tu cédula/correo y contraseña"),
        ),
      );

      return;
    }

    try {
      final resultado = await autenticacion.iniciarSesion(
        identificador,
        contrasena,
      );

      final nombre = resultado.nombre;

      final almacenamiento = TokenStorage();
      await almacenamiento.guardarRecordarme(recordarme);

      _irAEntradaPrincipal(nombre);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      String mensaje = "Error al iniciar sesión";
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        mensaje = "Cédula/Correo o contraseña incorrectos";
      } else if (e.code == 'wrong-password') {
        mensaje = "Contraseña incorrecta";
      } else if (e.code == 'invalid-email') {
        mensaje = "El formato del usuario o correo no es válido";
      } else if (e.code == 'too-many-requests') {
        mensaje = "Muchos intentos fallidos. Intente más tarde.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje)),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No se pudo iniciar sesión: $e")),
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

      final usuarioFirebase = usuario.user;
      if (usuarioFirebase != null) {
        await _guardarSesionFirebase(usuarioFirebase, nombre);
      }
      final almacenamiento = TokenStorage();
      await almacenamiento.guardarRecordarme(true);

      _irAEntradaPrincipal(nombre);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No se pudo iniciar sesión con Google")),
      );
    }
  }

  // INICIAR SESIÓN CON APPLE
  Future<void> iniciarSesionApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      final userCredential =
          await FirebaseAuth.instance.signInWithProvider(appleProvider);

      final user = userCredential.user;
      final nombre = user?.displayName ?? "Usuario Apple";

      if (user != null) {
        await _guardarSesionFirebase(user, nombre);
      }
      final almacenamiento = TokenStorage();
      await almacenamiento.guardarRecordarme(true);

      _irAEntradaPrincipal(nombre);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No se pudo iniciar sesión con Apple")),
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
                        funcion: iniciarSesionApple,
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
