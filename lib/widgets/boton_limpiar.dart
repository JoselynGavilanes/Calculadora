import 'package:flutter/material.dart';
import 'boton.dart';

class BotonLimpiar extends StatelessWidget {
  final VoidCallback onPressed;

  const BotonLimpiar({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Boton(
      label: 'C',
      onPressed: onPressed,
      color: Colors.redAccent,
      textColor: Colors.white,
    );
  }
}
