import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/components/password_conditions_tick.dart';
import 'package:test_app/components/prev_page_login_register_button.dart';
import 'package:test_app/components/register_standard_button.dart';
import '../api.dart';
import '../components/background.dart';
import '../constants.dart';
import 'signup.dart';
import 'package:email_validator/email_validator.dart';

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
  bool pwordEightChars;
  bool pwordLowerCase;
  bool pwordUpperCase;
  bool pwordDigit;
  bool pwordSpecialChar;
  bool emailExists;
  // String currentText;

  @override
  void initState() {
    isStudent = false;
    pwordEightChars = false;
    pwordUpperCase = false;
    pwordLowerCase = false;
    pwordDigit = false;
    pwordSpecialChar = false;
    emailExists = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void checkInput(String currentText) {
    if (currentText.contains(RegExp(r'[A-Z]'))) {
      setState(() {
        pwordUpperCase = true;
      });
    } else {
      pwordUpperCase = false;
    }

    if (currentText.contains(RegExp(r'[0-9]'))) {
      setState(() {
        pwordDigit = true;
      });
    } else {
      pwordDigit = false;
    }

    if (currentText.contains(RegExp(r'[a-z]'))) {
      setState(() {
        pwordLowerCase = true;
      });
    } else {
      pwordLowerCase = false;
    }

    if (currentText.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        pwordSpecialChar = true;
      });
    } else {
      pwordSpecialChar = false;
    }

    if (currentText.length >= 8) {
      setState(() {
        pwordEightChars = true;
      });
    } else {
      pwordEightChars = false;
    }
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
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(
                            RegExp("[ ]"), // dont allow input of whitespace
                          ),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter an email address";
                          } else if (EmailValidator.validate(value) != true) {
                            // use flutter email validator package to validate emails
                            return "Please enter a valid email address";
                          } else if (emailExists == true) {
                            return "An account with this email already exists.";
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
                        onChanged: (text) {
                          setState(() {
                            checkInput(_passwordController.text);
                          });
                        },
                        validator: (value) {
                          if (pwordSpecialChar == false ||
                              pwordDigit == false ||
                              pwordUpperCase == false ||
                              pwordLowerCase == false ||
                              pwordEightChars == false ||
                              value == null ||
                              value.isEmpty) {
                            return "Enter a valid password";
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 7.0),
                        child: Container(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              PasswordCondition(
                                pwordVariable: pwordEightChars,
                                conditionText: '8 chars +',
                              ),
                              PasswordCondition(
                                pwordVariable: pwordLowerCase,
                                conditionText: 'Lower case',
                              ),
                              PasswordCondition(
                                pwordVariable: pwordUpperCase,
                                conditionText: 'Upper case',
                              ),
                              PasswordCondition(
                                pwordVariable: pwordDigit,
                                conditionText: 'Numbers',
                              ),
                              PasswordCondition(
                                pwordVariable: pwordSpecialChar,
                                conditionText: 'Symbol',
                              ),
                            ],
                          ),
                        ),
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
                              : () async {
                                  String email = _emailController.text;
                                  String password = _passwordController.text;

                                  bool doesEmailExist = await apiService
                                      .isExistingStudentEmail(email);

                                  setState(() {
                                    emailExists = doesEmailExist;
                                  });

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
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(left: 15, top: 50),
              child: Align(
                alignment: Alignment.topLeft,
                child: PrevPageLoginRegisterButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
