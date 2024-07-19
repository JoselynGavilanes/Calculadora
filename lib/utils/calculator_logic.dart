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
        return (base*base).toString(); // Calcular la potencia
      } else {
        return 'Error';
      }
    } else {
      return displayValue + '^';
    }
  } else if (value == '!') {
    // Calcular factorial
    try {
      int num = int.tryParse(displayValue) ?? 0;
      if (num < 0) {
        return 'Error';
      }
      BigInt factorial = BigInt.one;
      for (int i = 2; i <= num; i++) {
        factorial *= BigInt.from(i);
      }
      return factorial.toString();
    } catch (e) {
      return 'Error';
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
    // Reemplaza 'log' con 'ln' para evaluar logaritmo natural
    expression = expression.replaceAll('log', 'ln');

    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  } catch (e) {
    return 'Error';
  }
}

