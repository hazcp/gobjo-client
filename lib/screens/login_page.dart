import 'package:flutter/material.dart';
import 'package:test_app/api.dart';
import 'package:test_app/components/prev_page_login_register_button.dart';
import 'package:test_app/screens/home_base.dart';
import '../components/background.dart';
import '../components/standard_button.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  // LoginPage(this.errorMessage);
  //
  // final String errorMessage;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool statusSwitch = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // String loginFailedError;
  bool accountWithEmailExists;
  bool passwordIsCorrect;

  @override
  void initState() {
    // loginFailedError = widget.errorMessage;
    accountWithEmailExists = false;
    passwordIsCorrect = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                            return "Enter your email";
                          } else if (!accountWithEmailExists) {
                            return "An account with that email does not exist";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your password";
                          } else if (accountWithEmailExists &&
                              !passwordIsCorrect) {
                            return "Your username and password do not match";
                          }
                          return null;
                        },
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
                        onPressed: () async {
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          bool doesAccountExistWithEmail =
                              await apiService.isExistingStudentEmail(email);
                          setState(() {
                            accountWithEmailExists = doesAccountExistWithEmail;
                          });
                          bool isPasswordCorrect = await apiService
                              .isPasswordCorrect(email, password);

                          setState(() {
                            passwordIsCorrect = isPasswordCorrect;
                          });

                          if (_formKey.currentState.validate()) {
                            apiService.loginStudent(email, password);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeBase(),
                              ),
                            );
                          }
                        },
                        colourButton: kPurpleThemeColour,
                      ),
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
