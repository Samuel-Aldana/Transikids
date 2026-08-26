import 'package:flutter/material.dart';

class PantallaTemporal extends StatelessWidget {
  final String titulo;

  const PantallaTemporal({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(titulo));
  }
}
