import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/login_screen.dart';
import 'package:bmi_calculator/screens/input_page.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;

    if (isLogin) {
      Timer(Duration(seconds: 1), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InputPage()));
      });
    } else {
      Timer(Duration(seconds: 1), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash());
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage("images/playstore.png")),
      ],
    ));
  }
}
