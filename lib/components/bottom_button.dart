import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final void Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Center(
            child: Text(buttonTitle, style: kLargeButtonTextStyle),
          ),
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: kBottomConatainerHeight,
          decoration: BoxDecoration(
            gradient: kBottomContainerColour,
          )),
    );
  }
}
