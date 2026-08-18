import 'package:flutter/material.dart';

class Ciudad extends StatelessWidget {
  const Ciudad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/ciudad.jpeg", height:200,)
      ],
    );
  }
}