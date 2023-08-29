import 'package:flutter/material.dart';

class BMIChart extends StatelessWidget {
  const BMIChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("bmi".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Baloo",
                fontWeight: FontWeight.bold,
                fontSize: 50)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 13,
              ),
              Text(
                "16-18.5 ".toUpperCase(),
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Baloo"),
              ),
              SizedBox(width: 136),
              Text(
                "UnderWeight".toUpperCase(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Baloo"),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 13,
              ),
              Text(
                "18.5-25 ".toUpperCase(),
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Baloo"),
              ),
              SizedBox(width: 200),
              Text(
                "Normal".toUpperCase(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Baloo"),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 13,
              ),
              Text(
                "25-30 ".toUpperCase(),
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Baloo"),
              ),
              SizedBox(width: 170),
              Text(
                "OverWeight".toUpperCase(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Baloo"),
              )
            ],
          )
        ],
      ),
    );
  }
}
