import 'package:flutter/material.dart';
import 'boton.dart';

class BotonFuncion extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BotonFuncion({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Boton(
      label: label,
      onPressed: onPressed,
      color: Colors.orange,
      textColor: Colors.white,
    );
  }
}
