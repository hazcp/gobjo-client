import 'package:flutter/material.dart';
import 'package:test_app/api.dart';
import 'package:test_app/components/prev_page_login_register_button.dart';
import 'package:test_app/screens/home_base.dart';
import '../components/background.dart';
import '../components/standard_button.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool statusSwitch = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            apiService.loginStudent(_emailController.text,
                                _passwordController.text);
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
