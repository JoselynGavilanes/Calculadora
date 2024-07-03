import 'package:flutter/material.dart';

class CajaTexto extends StatelessWidget {
  final String displayValue;

  const CajaTexto({
    required this.displayValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(16.0),
      child: Text(
        displayValue,
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}