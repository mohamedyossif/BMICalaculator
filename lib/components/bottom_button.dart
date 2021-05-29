import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  BottomButton({@required this.title,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.only(bottom: 9.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
