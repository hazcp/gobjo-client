import 'package:flutter/material.dart';
import '../api.dart';
import '../models/Student.dart';
import 'signup_page1.dart';
import 'signup_page2.dart';
import 'signup_page3.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: apiService.studentStream.stream,
      builder: (BuildContext context, AsyncSnapshot<Student> studentSnapshot) {
        print('builder called');

        if (studentSnapshot.hasData) {
          print(studentSnapshot.data.pageNumber);
          if (studentSnapshot.data.pageNumber == 1) {
            return SignUpPage1(studentSnapshot.data);
          } else if (studentSnapshot.data.pageNumber == 2) {
            return SignUpPage2(studentSnapshot.data);
          } else if (studentSnapshot.data.pageNumber == 3) {
            return SignUpPage3(studentSnapshot.data);
          }
        } else {
          print('no data');
        }
        return Text('Hello');
      },
    );
  }
}
