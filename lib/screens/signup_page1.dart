import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import '../components/background.dart';

class SignUpPage1 extends StatefulWidget {
  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(41.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(flex: 1),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What is your name?',
                      style: kSignUpTextStyle,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: ''),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'How old are you?',
                      style: kSignUpTextStyle,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: ''),
                    keyboardType: TextInputType.number,
                  ),
                  Spacer(flex: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: LinearProgressIndicator(
                          value: 0.33,
                          backgroundColor: kPurpleThemeColourTransparent,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(kPurpleThemeColour),
                        ),
                      ),
                      SizedBox(width: 50.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPurpleThemeColour,
            onPressed: () {
              print('pressed');
            },
            child: Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
