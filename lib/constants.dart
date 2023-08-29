import 'package:flutter/material.dart';

const kBottomConatainerHeight = 80.0;
const kActiveCardColour = Colors.lightGreenAccent;
const kInactiveCardColour = Colors.white;
const kBottomContainerColour = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topCenter,
    colors: [
      Colors.teal,
      Colors.lightGreenAccent,
    ]);

//Color(0xffacf206);

const kLabelTextStyle =
    TextStyle(letterSpacing: 2, fontSize: 18, color: Colors.white);

const kNumberTextStyle =
    TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white);

const kLargeButtonTextStyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
    color: Color(0xff24D876),
    fontSize: 25,
    fontWeight: FontWeight.bold,
    letterSpacing: 1);

const kBMITextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22,
);
