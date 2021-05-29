import 'package:flutter/material.dart';
import 'package:imb_calculator/components/bottom_button.dart';
import 'package:imb_calculator/components/reuseableCard.dart';

import '../constants.dart';
class Second extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;
  Second({this.bmi,this.interpretation,this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("BMI Calculator"),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  "Your Result",
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Reusable(
                colour: kInactiveCardColour,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: KResultTextStyle,
                    ),
                    Text(
                      bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                     interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              title: 'RECALCULATE',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ));
  }
}
