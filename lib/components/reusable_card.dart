import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, this.cardChild, this.onPress, this.br, this.d});
  final Color colour;
  final Widget? cardChild;
  final void Function()? onPress;
  final BorderRadiusGeometry? br;
  final Gradient? d;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(color: colour, borderRadius: br, gradient: d),
      ),
    );
  }
}
