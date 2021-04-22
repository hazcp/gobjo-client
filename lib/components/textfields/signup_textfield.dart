import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  SignUpTextField(
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
