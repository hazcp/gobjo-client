import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  StandardButton({this.textButton, this.onPressed, this.colourButton});

  final String textButton;
  final Function onPressed;
  final Color colourButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          colourButton,
        ),
      ),
      onPressed: onPressed,
      child: Text(textButton),
    );
  }
}
