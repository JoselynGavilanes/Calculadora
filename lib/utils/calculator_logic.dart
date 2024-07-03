import 'dart:math';
import 'package:math_expressions/math_expressions.dart';

String calculate(String displayValue, String value) {
  if (value == 'C') {
    return '0';
  } else if (value == 'CE') {
    if (displayValue.length == 1) {
      return '0';
    } else {
      return displayValue.substring(0, displayValue.length - 1);
    }
  } else if (value == '1/x') {
    if (displayValue == '0') {
      return 'Error';
    } else {
      double num = double.tryParse(displayValue) ?? 0;
      return (1 / num).toString();
    }
  } else if (value == '^') {
    // Implementación para calcular una potencia
    if (displayValue.contains('^')) {
      List<String> values = displayValue.split('^');
      if (values.length == 2) {
        double base = double.parse(values[0]);
        double exponent = double.parse(values[1]);
        return (base * base).toString(); // Calcular el cuadrado del número
      } else {
        return 'Error';
      }
    } else {
      return displayValue + '^';
    }
  } else {
    if (displayValue == '0') {
      return value;
    } else {
      return displayValue + value;
    }
  }
}

String evaluateExpression(String expression) {
  try {
    // Aquí puedes usar la lógica para evaluar la expresión
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  } catch (e) {
    return 'Error';
  }
}

