import 'package:flutter/material.dart';
import '../constants.dart';

class StandardButton extends StatelessWidget {
  StandardButton({this.textButton, this.onPressed});

  final String textButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          kPurpleThemeColour,
        ),
      ),
      onPressed: onPressed,
      child: Text(textButton),
    );
  }
}
