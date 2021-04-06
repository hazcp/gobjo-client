import 'package:flutter/material.dart';
import '../constants.dart';

class NextPageButton extends StatelessWidget {
  NextPageButton({this.onPress});

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPurpleThemeColour,
      onPressed: onPress,
      child: Icon(Icons.chevron_right),
    );
  }
}
