import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  final Widget childCard;

  final Color colour;
  final Function onPress;

  Reusable({@required this.childCard, this.colour, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
