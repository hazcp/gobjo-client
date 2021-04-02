import 'package:flutter/material.dart';
import '../components/background.dart';
import '../components/standard_button.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool statusSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: IntrinsicWidth(
                stepWidth: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email Address'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      // prevent input suggestions
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    StandardButton(
                      textButton: 'SIGN IN',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/student_home',
                        );
                      },
                      colourButton: kPurpleThemeColour,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
