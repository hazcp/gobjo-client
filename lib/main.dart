import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/screens/login_register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        errorColor: kPurpleThemeColour,
      ),
      home: LoginRegisterPage(),
    );
  }
}
