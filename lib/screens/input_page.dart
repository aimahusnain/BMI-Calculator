import 'package:bmi_calculator/screens/BMI_Chart.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bmi_calculator/screens/login_screen.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
} //

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  Gender? selectedGender;
  int height = 100;
  int weight = 60;
  int age = 25;

  String email = '', agelogin = '', name = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? '';
    agelogin = sp.getString("age") ?? '';
    name = sp.getString("username") ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontFamily: "Baloo",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 5),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //DrawerHeader(child: Text("Muhammad Husnain")),
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/jogging.jpg"),
                ),
              ),
              accountName: Row(
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    name.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Baloo",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              accountEmail: Row(
                children: [
                  Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    email.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                }),
            // ListTile(
            //     leading: Icon(Icons.shopping_cart),
            //     title: Text("Cart"),
            //     onTap: () {}),
            Divider(
              color: Color(0xff4c4c4c),
              thickness: 1.3,
              indent: 7,
              endIndent: 7,
            ),

            // ListTile(
            //     leading: Icon(Icons.eject),
            //     title: Text("Send FeedBack"),
            //     onTap: () async {
            //       final url = Uri.parse("Google.com");
            //       if (await canLaunchUrl(url)) {
            //         await launchUrl(url);
            //       }
            //     }),
            ListTile(
                leading: Icon(Icons.eject),
                title: Text("Check BMI Chart"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BMIChart()));
                }),

            Divider(
              color: Colors.black,
              thickness: 0.2,
              indent: 85,
              endIndent: 85,
            ),

            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.cyan])
                      //color: Colors.green,
                      ),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text('Logout'),
                  )),
            )
          ],
        ),
      ),
      backgroundColor: Colors.teal[400],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  br: BorderRadius.circular(100.0),
                  //male
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    iconColor: Colors.blue,
                    icon: FontAwesomeIcons.male,
                    label: "MALE",
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  d: LinearGradient(
                    colors: [
                      Colors.green,
                      Color(0xff90fe93),
                    ],
                  ),
                  br: BorderRadius.circular(40.0),
                  colour: kInactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),

                          // FloatingActionButton(
                          //   backgroundColor: Colors.deepPurple,
                          //   onPressed: () {},
                          //   child: Icon(
                          //     Icons.add,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                      //pk49mezn0038010107620345
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            // WA
            child: Row(
              children: [
                Expanded(
                  //female
                  child: ReusableCard(
                    br: BorderRadius.circular(100.0),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      iconColor: Colors.pink,
                      icon: FontAwesomeIcons.female,
                      label: "FEMALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    d: LinearGradient(
                      colors: [
                        Colors.green,
                        Color(0xff90fe93),
                      ],
                    ),
                    br: BorderRadius.circular(40.0),
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),

                            // FloatingActionButton(
                            //   backgroundColor: Colors.deepPurple,
                            //   onPressed: () {},
                            //   child: Icon(
                            //     Icons.add,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                        //pk49mezn0038010107620345
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            //Slider
            child: ReusableCard(
              d: LinearGradient(
                colors: [
                  Colors.green,
                  Color(0xff90fe93),
                ],
              ),
              br: BorderRadius.circular(40.0),
              colour: kActiveCardColour,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.blue,
                          activeTrackColor: Color(0xffEB1555),
                          thumbColor: Colors.teal[700],
                          overlayColor: Color(0xff51bcb1),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 25,
                        max: 272,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ]),
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretaion: calc.getInterpretation(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
