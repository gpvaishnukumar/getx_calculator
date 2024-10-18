import 'package:get/get.dart';

class CalculatorState {
// tracking the result by using obs
  final _result = ''.obs;
  final _mathExpression = ''.obs;

  get getResult => _result.value;

  get getMathExpression => _mathExpression.value;

  set mathExpression(String expr) {
    _mathExpression.value = expr;
  }

  set result(String result) {
    _result.value = result;
  }
}
