import 'package:flutter/material.dart';
import 'package:test_app/screens/login_page.dart';
import 'package:test_app/screens/splash_screen.dart';
import 'package:test_app/screens/student_home_base.dart';
import '../api.dart';
import '../models/Student.dart';
import 'signup_page1.dart';
import 'signup_page2.dart';
import 'signup_page3.dart';

class HomeBase extends StatefulWidget {
  @override
  _HomeBaseState createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
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
          } else if (studentSnapshot.data.pageNumber == 4) {
            return StudentHomeBase(studentSnapshot.data);
          }
          // TODO: IMPLEMENT ADDING OF PROFILE PHOTO
          // TODO: IMPLEMENT YOU HAVE SUCESSFULLY CREATED AN ACCOUNT
        } else {
          print('no data');
        }
        return SplashScreen();
      },
    );
  }
}
