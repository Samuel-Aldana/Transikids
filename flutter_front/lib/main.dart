import 'package:flutter/material.dart';
import 'bases/colores/colores.dart';
import 'pantallas/inicial.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: AppColors.base, body: Inicial()),
    );
  }
}
