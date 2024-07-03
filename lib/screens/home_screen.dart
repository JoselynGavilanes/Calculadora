import 'package:calculadora/screens/calculator_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('PROGRAMACIÓN AVANZADA'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Proyecto Grupal',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 30),
            _buildMemberList(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), // Color de fondo del botón
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              child: Text(
                'Iniciar Calculadora',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Color del texto del botón
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberList() {
    return Column(
      children: [
        _buildMemberItem('Jefferson Aguilar'),
        _buildMemberItem('Belen Salazar'),
        _buildMemberItem('German Noguera'),
        _buildMemberItem('Joselyn Gavilanes'),
      ],
    );
  }

  Widget _buildMemberItem(String name) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            color: Colors.blueAccent,
          ),
          SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(fontSize: 20, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}