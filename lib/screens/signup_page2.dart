import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import '../components/background.dart';
import '../components/signup_textfield.dart';
import 'package:dropdownfield/dropdownfield.dart';

final List<String> unis = [
  'University of Liverpool',
  'University of Manchester',
  'University of Bristol',
  'University of Durham',
  'University of Exeter',
];
final uniSelected = TextEditingController();
String selectedUniversity = '';

class SignUpPage2 extends StatefulWidget {
  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
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
                      'What is your postcode?',
                      style: kSignUpTextStyle,
                    ),
                  ),
                  SignUpTextField(),
                  SizedBox(
                    height: 70.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What university do you go to?',
                      style: kSignUpTextStyle,
                    ),
                  ),
                  DropDownField(
                    controller: uniSelected,
                    items: unis,
                    hintText: 'Choose your University',
                    enabled: true,
                    onValueChanged: (val) {
                      selectedUniversity = val;
                    },
                  ),
                  Spacer(flex: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: LinearProgressIndicator(
                          value: 0.50,
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
