import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_calculator_app/constants.dart';
import 'package:getx_calculator_app/screens/calculator/controller.dart';
import 'package:getx_calculator_app/utils/helpers.dart';
import 'package:getx_calculator_app/widgets/button.dart';
import 'package:getx_calculator_app/widgets/display.dart';

class Calculator extends GetView<CalculatorController> {
  Calculator({super.key});

  final labelRowOne = ['C', '%', '<', '÷'];
  final labelRowTwo = ['7', '8', '9', '×'];
  final labelRowThree = ['4', '5', '6', '-'];
  final labelRowFour = ['1', '2', '3', '+'];
  final labelRowFive = ['00', '0', '.', '='];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: baseColor,
        body: SafeArea(
          child: Column(
            children: [
              ResultDisplayScreen(
                  expression: ExpressionInput(
                      evaluatedResult: controller.states.getResult != '0'
                          ? "= ${controller.states.getResult}"
                          : "",
                      expressionString: controller.states.getMathExpression)),
              buildBtnRow(labelRowOne),
              buildBtnRow(labelRowTwo),
              buildBtnRow(labelRowThree),
              buildBtnRow(labelRowFour),
              buildBtnRow(labelRowFive),
              SizedBox(
                height: defaultPadding * 4,
              ),
              Text(
                "CALCULATOR 1.0",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildBtnRow(List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...labels.map(
          (label) => Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: CalkiButton(
              color: getBgColor(label),
              onTap: () {
                controller.updatePressState(label);
                debugPrint(label);
              },
              child: Center(
                child: label == "<"
                    ? Icon(
                        Icons.backspace,
                        size: 20,
                        color: Colors.black87,
                      )
                    : Text(
                        label,
                        style: TextStyle(color: getTextColor(label)),
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
