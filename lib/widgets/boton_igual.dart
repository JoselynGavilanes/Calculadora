import 'package:flutter/material.dart';
import 'boton.dart';

class BotonIgual extends StatelessWidget {
  final VoidCallback onPressed;

  const BotonIgual({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Boton(
      label: '=',
      onPressed: onPressed,
      color: Colors.blueAccent,
      textColor: Colors.white,
    );
  }
}