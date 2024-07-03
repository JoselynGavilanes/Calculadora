import 'package:flutter/material.dart';
import 'boton.dart';

class BotonOperacion extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BotonOperacion({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Boton(
      label: label,
      onPressed: onPressed,
      color: Colors.blueAccent,
      textColor: Colors.white,
    );
  }
}