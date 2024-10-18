import 'package:flutter/material.dart';
import 'package:getx_calculator_app/constants.dart';

cleanExpression(String expression) {
  if (expression.endsWith('×') ||
      expression.endsWith('-') ||
      expression.endsWith('+') ||
      expression.endsWith('÷') ||
      expression.endsWith('.')) {
    return expression.substring(0, expression.length -1);
  }else{
    return expression;
  }
}

getBgColor(String label) {
  switch (label) {
    case "C":
    case "%":
    case "<":
    case "÷":
    case "×":
    case "-":
    case "+":
    case "=":
      return secondaryColor;
    default:
      return baseColor;
  }
}

getTextColor(String label) {
  switch (label) {
    case "C":
    case "%":
    case "<":
    case "÷":
    case "×":
    case "-":
    case "+":
    case "=":
      return Colors.black87;
    default:
      return Colors.black;
  }
}
