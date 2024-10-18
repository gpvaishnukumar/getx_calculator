import 'package:get/get.dart';
import 'package:getx_calculator_app/screens/calculator/index.dart';
import 'package:getx_calculator_app/utils/helpers.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  final states = CalculatorState();
  final _expression = ''.obs;

  // get getExpression => _expression.value;

  @override
  void onInit() {
    _expression.value = '';
    states.result = '0';
    super.onInit();
  }

  void _onEqualPressed(String exprString) {
    String cleanedExpression = cleanExpression(
        exprString); // remove unused operator eg. 2+3+3+ => 2+3+3
    String input = cleanedExpression
        .replaceAll("÷", "/")
        .replaceAll("×", "*"); // convert to math to real math operrators
    Parser parser = Parser();
    Expression expression = parser.parse(input);
    ContextModel model = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, model);

    states.result = eval.toString();
  }

  updatePressState(String label) {
    switch (label) {
      case "C":
        _expression.value = '';
        states.result = '0';
        states.mathExpression = '';

        break;

      case "<":
        _expression.value =
            _expression.value.substring(0, _expression.value.length - 1);
        states.mathExpression = _expression.value;

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
