import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label, this.iconColor});
  final IconData icon;
  final String label;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: iconColor,
        ),
        SizedBox(height: 15),
        Text(label,
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
