import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:async/async.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretaion});

  final String bmiResult;
  final String resultText;
  final String interpretaion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
          backgroundColor: Colors.purple),
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(13),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Health Status".toUpperCase(),
                style: TextStyle(
                    fontFamily: "Baloo",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 35),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: Colors.white,
                br: BorderRadius.circular(50),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretaion.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      resultText,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                )),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
