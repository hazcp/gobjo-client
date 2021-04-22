import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpNameTextField extends StatelessWidget {
  SignUpNameTextField(
      {this.keyboardType, this.textController, this.validatorFunction});

  final TextInputType keyboardType;
  final TextEditingController textController;
  final Function validatorFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: textController,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp(
                "[a-zA-Z ]"), // allow only whitespace + lcase / ucase letters
          ),
        ],
        validator: validatorFunction,
        decoration: InputDecoration(
          labelText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
