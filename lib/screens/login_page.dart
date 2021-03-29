import 'package:flutter/material.dart';
import '../components/background.dart';
import '../constants.dart';
import '../components/standard_button.dart';
import 'signup_page1.dart';

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
                    Row(
                      children: <Widget>[
                        Text('Are you a Student?'),
                        SizedBox(
                          width: 120.0,
                        ),
                        Switch(
                            value: statusSwitch,
                            activeColor: kPurpleThemeColour,
                            onChanged: (val) {
                              setState(() {
                                statusSwitch = val;
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    StandardButton(
                      textButton: 'CREATE ACCOUNT',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage1(),
                          ),
                        );
                      },
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
