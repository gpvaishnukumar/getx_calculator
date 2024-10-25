// lib/screens/calculator/controller.dart

import 'package:get/get.dart';
import 'package:getx_calculator_app/screens/calculator/index.dart';
import 'package:getx_calculator_app/utils/helpers.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  final states = CalculatorState();
  final _expression = ''.obs;

  @override
  void onInit() {
    _expression.value = '';
    states.result = '0';
    super.onInit();
  }

  void _onEqualPressed(String exprString) {
    String cleanedExpression = cleanExpression(exprString);
    String input = cleanedExpression
        .replaceAll("÷", "/")
        .replaceAll("×", "*");

    // Calculate percentage if present
    if (cleanedExpression.contains('%')) {
      double result = calculateMixedExpression(cleanedExpression);
      states.result = formatResult(result);
      return;
    }

    Parser parser = Parser();
    Expression expression = parser.parse(input);
    ContextModel model = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, model);

    states.result = formatResult(eval);
  }

  double calculateMixedExpression(String expression) {
    // Split expression into parts based on the operators
    List<String> parts = expression.split(RegExp(r'(?=\+|\-|\×|\÷)'));
    double total = 0;

    for (String part in parts) {
      if (part.contains('%')) {
        // Calculate each percentage in succession
        double value = double.parse(part.replaceAll('%', '').trim());
        int percentageCount = part.length - value.toString().length; // Count the number of '%'
        for (int i = 0; i < percentageCount; i++) {
          value /= 100; // Reduce the value by 1%
        }
        total += value;
      } else {
        // Treat this as a regular operation
        total += double.parse(part.replaceAll(RegExp(r'[^0-9\-\.]'), ''));
      }
    }

    return total;
  }

  String formatResult(double result) {
    // Format the result to avoid showing .0 for whole numbers
    return result.toStringAsFixed(0); // Round to the nearest whole number
  }

  updatePressState(String label) {
    switch (label) {
      case "C":
        _expression.value = '';
        states.result = '0';
        states.mathExpression = '';
        break;

      case "<":
        if (_expression.value.isNotEmpty) {
          _expression.value =
              _expression.value.substring(0, _expression.value.length - 1);
          states.mathExpression = _expression.value;
        }
        break;

      case "=":
        _onEqualPressed(states.getMathExpression);
        break;

      case "%":
      case "÷":
      case "×":
      case "-":
      case "+":
        _expression.value += label;
        states.mathExpression = _expression.value;
        break;

      default:
        _expression.value += label;
        states.mathExpression = _expression.value;
    }
  }
}
