import 'package:flutter/material.dart';

import '../constants.dart';

class PasswordCondition extends StatelessWidget {
  PasswordCondition({this.pwordVariable, this.conditionText});

  final bool pwordVariable;
  final String conditionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        (pwordVariable == false)
            ? Icon(Icons.close, size: 12, color: kGreyColour)
            : Icon(Icons.done, size: 12, color: kPurpleThemeColour),
        Text(
          conditionText,
          style: (pwordVariable == false)
              ? TextStyle(color: kGreyColour, fontSize: 10)
              : TextStyle(color: kPurpleThemeColour, fontSize: 10),
        ),
      ],
    );
  }
}
