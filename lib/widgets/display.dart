import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:getx_calculator_app/constants.dart';

class ExpressionInput {
  final String expressionString;
  final String evaluatedResult;

  ExpressionInput(
      {required this.expressionString, required this.evaluatedResult});
}

class ResultDisplayScreen extends StatelessWidget {
  final ExpressionInput expression;

  const ResultDisplayScreen({super.key, required this.expression});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding,
      ),
      child: ClayContainer(
        depth: -25,
        borderRadius: 16,
        color: baseColor,
        curveType: CurveType.none,
        height: 200,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: defaultPadding * 2,
                right: defaultPadding * 2,
              ),
              child: Text(
                expression.expressionString,
                style: Theme.of(context)
                .textTheme
                .titleLarge
                  ?.copyWith(color: Colors.black87),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: defaultPadding *2, bottom: defaultPadding, top: 8),
              child: Text("${expression.evaluatedResult.isNotEmpty ? expression.evaluatedResult : ''}",
                style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.red),

              ),
            )
          ],
        ),
      ),
    );
  }
}
