import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imb_calculator/caculator_brain.dart';
import 'package:imb_calculator/components/bottom_button.dart';
import 'package:imb_calculator/components/iconContent.dart';
import 'package:imb_calculator/components/reuseableCard.dart';
import 'package:imb_calculator/components/roundButton.dart';
import 'package:imb_calculator/constants.dart';
import 'package:imb_calculator/screens/second.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum Gender { male, female }

class _HomeState extends State<Home> {
  Gender selectGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    colour: selectGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    childCard: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Reusable(
                    childCard: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      label: 'FeMale',
                    ),
                    colour: selectGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Reusable(
              colour: kInactiveCardColour,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    colour: kInactiveCardColour,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundButton(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    colour: kInactiveCardColour,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundButton(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              CalculatorBrain _calculatorBrain =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Second(
                    bmi: _calculatorBrain.calculateBMI(),
                    result: _calculatorBrain.getResult(),
                    interpretation: _calculatorBrain.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
