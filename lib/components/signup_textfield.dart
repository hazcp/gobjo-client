import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  SignUpTextField({this.keyboardType, this.textController});

  final TextInputType keyboardType;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          labelText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
