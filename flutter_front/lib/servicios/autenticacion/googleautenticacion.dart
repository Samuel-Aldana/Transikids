import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAutenticacion {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> iniciarSesionConGoogle() async {
    try {
      if (kIsWeb) {
        // INICIO DE SESIÓN EN WEB
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider.setCustomParameters({'prompt': 'select_account'});

        return await _auth.signInWithPopup(googleProvider);
      } else {
        // INICIO DE SESIÓN EN ANDROID
        final GoogleSignIn googleSignIn = GoogleSignIn.instance;

        await googleSignIn.initialize(
          serverClientId:
              '730625492472-tti2pe7mldtkvh0j62bge3nd6ojd8ig9.apps.googleusercontent.com',
        );

        final GoogleSignInAccount cuenta = await googleSignIn.authenticate();

        final GoogleSignInAuthentication googleAuth = cuenta.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
        );

        return await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      ('Error al iniciar sesión con Google: $e');
      return null;
    }
  }

  Future<void> cerrarSesion() async {
    if (!kIsWeb) {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.signOut();
    }

    await _auth.signOut();
  }
}
