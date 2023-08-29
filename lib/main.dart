import 'package:bmi_calculator/screens/s.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/login_screen.dart';

void main() async {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light().copyWith(
      //   colorScheme: ColorScheme.light().copyWith(primary: Color(0xff0A0D22)),
      //   scaffoldBackgroundColor: Color(0xfCDDC39),
      // ),
      home: SplashScreen(),
    );
  }
}
