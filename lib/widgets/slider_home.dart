import 'package:flutter/material.dart';

class SliderHome extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final double value;

  const SliderHome({Key? key, required this.onChanged, required this.value}) : super(key: key);

  @override
  _SliderHomeState createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Slider Personalizado',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Slider(
          value: widget.value,
          onChanged: widget.onChanged,
          min: 0,
          max: 100,
          divisions: 100,
          label: widget.value.round().toString(),
        ),
      ],
    );
  }
}
