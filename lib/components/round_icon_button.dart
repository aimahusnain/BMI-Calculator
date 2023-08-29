import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      fillColor: Colors.teal,
    );
  }
}
