import 'package:flutter/material.dart';
import 'package:test_app/components/register_standard_button.dart';
import '../api.dart';
import '../components/background.dart';
import '../constants.dart';
import 'signup.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isStudent;

  @override
  void initState() {
    isStudent = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter an email address";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        // prevent input suggestions
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a password";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        // prevent input suggestions
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm your password";
                          } else if (value != _passwordController.text) {
                            return "These passwords didn't match. Try again.";
                          }
                          return null;
                        },
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
                            value: isStudent,
                            activeColor: kPurpleThemeColour,
                            onChanged: (val) {
                              setState(() {
                                isStudent = val;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RegisterStandardButton(
                          textButton: 'CREATE ACCOUNT',
                          onPressed: !isStudent
                              ? null
                              : () {
                                  String email = _emailController.text;
                                  String password = _passwordController.text;

                                  if (_formKey.currentState.validate()) {
                                    apiService.createStudent(email, password);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUp(),
                                      ),
                                    );
                                  }
                                },
                          colourButton: kPurpleThemeColour),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
