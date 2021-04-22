import 'package:flutter/material.dart';
import '../constants.dart';

class PrevPageLoginRegisterButton extends StatelessWidget {
  PrevPageLoginRegisterButton({this.onPress});

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xfffffff),
      focusElevation: 0,
      highlightElevation: 0,
      elevation: 0,
      onPressed: onPress,
      child: Icon(Icons.chevron_left, color: kPurpleThemeColour),
    );
  }
}
