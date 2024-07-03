import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String displayValue;

  const DisplayScreen({Key? key, required this.displayValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      alignment: Alignment.bottomRight,
      child: Text(
        displayValue,
        style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      ),
    );
  }
}