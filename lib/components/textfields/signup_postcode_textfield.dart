import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPostcodeTextField extends StatelessWidget {
  SignUpPostcodeTextField(
      {this.keyboardType, this.textController, this.validatorFunction});

  final TextInputType keyboardType;
  final TextEditingController textController;
  final Function validatorFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp("[a-zA-Z0-9]"), // allow only numbers + lcase / ucase letters
          ),
          UpperCaseTextFormatter(), // make any lcase letters -> ucase
        ],
        controller: textController,
        validator: validatorFunction,
        decoration: InputDecoration(
          labelText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        textCapitalization: TextCapitalization.characters,
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
