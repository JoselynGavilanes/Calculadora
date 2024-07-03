import 'package:flutter/material.dart';
import 'boton.dart';

class BotonNumerico extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BotonNumerico({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Boton(
      label: label,
      onPressed: onPressed,
      color: Colors.grey.shade600,
      textColor: Colors.white,
    );
  }
}
