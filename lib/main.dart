import 'package:flutter/material.dart';
import 'screens/register_page.dart';
import 'screens/student_hub.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => RegisterPage(),
          '/student_home': (context) => StudentHub(),
          //    '/student_search': (conext) => StudentSearch(),
        });
  }
}
