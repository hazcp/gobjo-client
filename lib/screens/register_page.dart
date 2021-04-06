import 'package:flutter/material.dart';
import '../api.dart';
import '../components/background.dart';
import '../constants.dart';
import '../components/standard_button.dart';
import 'signup.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool statusSwitch = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordSame(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    } else {
      return false;
    }
  }

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
                      controller: _emailController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      // prevent input suggestions
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _passwordController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      // prevent input suggestions
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _confirmPasswordController,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Are you a Student?'),
                        SizedBox(
                          width: 120.0,
                        ),
                        SizedBox(
                          height: 20.0,
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
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String confirmPassword =
                            _confirmPasswordController.text;

                        if (isPasswordSame(password, confirmPassword)) {
                          apiService.createStudent(email, password);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        } else {
                          print('no sir');
                        }
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
