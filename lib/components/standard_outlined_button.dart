import 'package:flutter/material.dart';

class StandardOutlinedButton extends StatelessWidget {
  StandardOutlinedButton(
      {this.textButton,
      this.onPressed,
      this.buttonTextColour,
      this.buttonColour});

  final String textButton;
  final Function onPressed;
  final Color buttonTextColour;
  final Color buttonColour;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColour,
      ),
      child: Text(
        textButton,
        style: TextStyle(
          color: buttonTextColour,
        ),
      ),
    );
  }
}
