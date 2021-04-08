import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/components/bottom_progress_row.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/models/Student.dart';
import '../api.dart';
import '../components/background.dart';
import '../components/signup_textfield.dart';

class SignUpPage1 extends StatefulWidget {
  SignUpPage1(this.student);

  final Student student;

  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

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
                  SignUpTextField(
                    textController: _nameController,
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
                  SignUpTextField(
                    keyboardType: TextInputType.number,
                    textController: _ageController,
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
              String name = _nameController.text;
              int age = int.parse(_ageController.text);

              apiService.updateStudent(
                widget.student.id,
                {"name": name, "age": age, "pageNumber": 2},
              );
            },
            child: Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
