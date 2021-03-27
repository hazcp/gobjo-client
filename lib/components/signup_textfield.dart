import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  SignUpTextField({this.keyboardType});

  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
