import 'package:flutter/material.dart';
import 'boton.dart';

class BotonEspecial extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BotonEspecial({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Boton(
      label: label,
      onPressed: onPressed,
      color: Colors.redAccent,
      textColor: Colors.white,
    );
  }
}
