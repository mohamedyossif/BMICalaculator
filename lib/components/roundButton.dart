import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final IconData iconData;
  final Function onPress;
  RoundButton({@required this.iconData,@required this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 0.0,
      constraints:BoxConstraints.tightFor(height: 50.0,width: 50.0) ,
      shape:CircleBorder() ,
      fillColor:  Color(0xFF4C4F5E),

    );
  }
}
