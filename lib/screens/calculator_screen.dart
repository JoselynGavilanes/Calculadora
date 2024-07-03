import 'dart:math';
import 'package:flutter/material.dart';
import 'package:calculadora/utils/display_screen.dart';
import 'package:calculadora/widgets/boton_especial.dart';
import 'package:calculadora/widgets/boton_funcion.dart';
import 'package:calculadora/widgets/boton_igual.dart';
import 'package:calculadora/widgets/boton_numerico.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculadora/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayValue = '0';
  String currentExpression = '';
  String result = ''; // Resultado de la operación actual
  List<String> operationHistory = []; // Lista para almacenar el historial de operaciones completas

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        displayValue = '0';
        currentExpression = '';
        result = '';
      } else if (value == 'CE') {
        if (displayValue.length == 1) {
          displayValue = '0';
          currentExpression = '';
        } else {
          displayValue = displayValue.substring(0, displayValue.length - 1);
          currentExpression = currentExpression.substring(0, currentExpression.length - 1);
        }
      } else if (value == '=') {
        result = calculate(displayValue);
        addToHistory('$currentExpression = $result');
        displayValue = result;
        currentExpression = '';
      } else {
        // Modificar aquí para agregar más funciones matemáticas
        if (value == '%') {
          // Calcular el porcentaje
          double num = double.tryParse(displayValue) ?? 0;
          num /= 100;
          displayValue = num.toString();
          currentExpression += '%';
        } else if (value == '√') {
          // Raíz cuadrada
          double num = double.tryParse(displayValue) ?? 0;
          num = sqrt(num); // Calcula la raíz cuadrada
          displayValue = num.toString();
          currentExpression += '√($displayValue)';
        } else if (value == 'x^2') {
          // Elevar al cuadrado
          double? num = double.tryParse(displayValue) ?? 0;
          num = num * num;
          displayValue = num.toString();
          currentExpression += 'x^2';
        } else if (value == '1/x') {
          // Inverso
          double num = double.tryParse(displayValue) ?? 0;
          double inverse = 1 / num;
          displayValue = inverse.toString();
          currentExpression += '1/($num)';
        } else if (value == '+/-') {
          // Cambiar signo
          double num = double.tryParse(displayValue) ?? 0;
          num = -num;
          displayValue = num.toString();
          currentExpression = displayValue;
        } else {
          // Otros botones numéricos y operaciones básicas
          if (displayValue == '0' && value != '.') {
            displayValue = value;
            currentExpression = value;
          } else {
            displayValue += value;
            currentExpression += value;
          }
        }
      }
    });
  }

  void addToHistory(String operation) {
    setState(() {
      operationHistory.add(operation);
    });
  }

  void clearHistory() {
    setState(() {
      operationHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Historial de Operaciones'),
                    content: Container(
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: operationHistory.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(operationHistory[index]),
                          );
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Limpiar Historial'),
                        onPressed: () {
                          clearHistory();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Column(
          children: [
            Expanded(
              child: DisplayScreen(displayValue: displayValue),
            ),
            SizedBox(height: 10),
            buildButtonRow([
              '%', '1/x', '√', 'x^2'
            ], (label) {
              if (label == '%') {
                return BotonFuncion(label: label, onPressed: () {
                  onButtonPressed(label);
                });
              } else {
                return BotonFuncion(label: label, onPressed: () {
                  onButtonPressed(label);
                });
              }
            }),
            SizedBox(height: 20),
            buildButtonRow([
              'C', 'CE', '÷', '^'
            ], (label) => BotonEspecial(label: label, onPressed: () {
              onButtonPressed(label);
            })),
            SizedBox(height: 10),
            buildButtonRow([
              '7', '8', '9', 'x'
            ], (label) => BotonNumerico(label: label, onPressed: () {
              onButtonPressed(label);
            })),
            SizedBox(height: 10),
            buildButtonRow([
              '4', '5', '6', '-'
            ], (label) => BotonNumerico(label: label, onPressed: () {
              onButtonPressed(label);
            })),
            SizedBox(height: 10),
            buildButtonRow([
              '1', '2', '3', '+'
            ], (label) => BotonNumerico(label: label, onPressed: () {
              onButtonPressed(label);
            })),
            SizedBox(height: 10),
            buildButtonRow([
              '+/-', '0', '.', '='
            ], (label) => label == '=' ? BotonIgual(onPressed: () {
              onButtonPressed(label);
            }) : BotonNumerico(label: label, onPressed: () {
              onButtonPressed(label);
            })),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> labels, Widget Function(String) builder) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Ajusta el espacio vertical entre las filas de botones
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: labels.map((label) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0), // Ajusta el espacio horizontal entre los botones
            child: builder(label),
          ),
        )).toList(),
      ),
    );
  }

  String calculate(String expression) {
    try {
      // Reemplaza 'log' con 'ln' para evaluar logaritmo natural
      expression = expression.replaceAll('ln', 'ln');

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }
}
