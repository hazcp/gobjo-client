import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpAgeTextField extends StatelessWidget {
  SignUpAgeTextField(
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
            FilteringTextInputFormatter
                .digitsOnly // only allow numbers to be input
          ],
          controller: textController,
          validator: validatorFunction,
          decoration: InputDecoration(
            labelText: '',
            border: OutlineInputBorder(),
          ),
          keyboardType: keyboardType,
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback(
                (_) => textController.clear()); // allows validation to work
          }),
    );
  }
}
