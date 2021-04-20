import 'package:test_app/constants.dart';
import 'package:flutter/material.dart';

class RegisterStandardButton extends StatelessWidget {
  RegisterStandardButton({this.textButton, this.onPressed, this.colourButton});

  final String textButton;
  final Function onPressed;
  final Color colourButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return colourButton;
            } else if (states.contains(MaterialState.disabled)) {
              return kGreyColour;
            }
            return kPurpleThemeColour; // Use the component's default.
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(textButton),
    );
  }
}
