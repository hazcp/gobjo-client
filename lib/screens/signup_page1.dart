import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/components/bottom_progress_row.dart';
import 'package:test_app/components/textfields/signup_name_textfield.dart';
import '../components/textfields/signup_age_textfield.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/models/Student.dart';
import '../api.dart';
import '../components/background.dart';

class SignUpPage1 extends StatefulWidget {
  SignUpPage1(this.student);

  final Student student;

  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.student.name != null) {
      _nameController.text = widget.student.name;
      _nameController.selection = TextSelection.fromPosition(
          TextPosition(offset: _nameController.text.length));
    }
    if (widget.student.age != null) {
      _ageController.text = widget.student.age.toString();
      _ageController.selection = TextSelection.fromPosition(
          TextPosition(offset: _ageController.text.length));
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
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
                    SignUpNameTextField(
                      textController: _nameController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How old are you?',
                        style: kSignUpTextStyle,
                      ),
                    ),
                    SignUpAgeTextField(
                      keyboardType: TextInputType.number,
                      textController: _ageController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your age";
                        }
                        return null;
                      },
                    ),
                    Spacer(flex: 3),
                    BottomProgressRow(
                      fractionProgress: 0.25,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: kPurpleThemeColour,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  String name = _nameController.text;
                  int age = int.parse(_ageController.text);
                  apiService.updateStudent(
                    widget.student.id,
                    {"name": name, "age": age, "pageNumber": 2},
                  );
                }
              },
              child: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
