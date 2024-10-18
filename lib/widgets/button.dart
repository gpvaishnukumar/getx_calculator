
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_calculator_app/constants.dart';

class CalkiButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final VoidCallback onTap;
  const CalkiButton(
      {super.key, required this.child, this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClayContainer(
        parentColor: color,
        height: 60,
        width: 60,
        borderRadius: 12,
        color: color ?? baseColor,
        child: child,
      ),
    );
  }
}
