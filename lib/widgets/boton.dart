import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const Boton({
    required this.label,
    required this.onPressed,
    this.color = Colors.grey,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color), // Color de fondo del botón
        foregroundColor: MaterialStateProperty.all<Color>(textColor), // Color del texto del botón
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)), // Ajusta el tamaño del botón
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20)), // Ajusta el tamaño del texto
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), // Borde redondeado
      ),
      child: Text(label),
    );
  }
}
