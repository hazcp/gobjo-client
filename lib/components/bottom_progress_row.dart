import 'package:flutter/material.dart';
import '../constants.dart';

class BottomProgressRow extends StatelessWidget {
  BottomProgressRow({this.fractionProgress});

  final double fractionProgress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 50.0),
        Flexible(
          child: LinearProgressIndicator(
            value: fractionProgress,
            backgroundColor: kPurpleThemeColourTransparent,
            valueColor: AlwaysStoppedAnimation<Color>(kPurpleThemeColour),
          ),
        ),
        SizedBox(width: 50.0),
      ],
    );
  }
}
