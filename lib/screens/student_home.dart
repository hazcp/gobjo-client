import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'student_home_contents.dart';

import '../constants.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  int selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    Text(
      'Jobs Page',
    ),
    StudentHomeContents(),
    Text(
      'Profile Page',
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(41.0),
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPurpleThemeColour,
        fixedColor: Colors.white,
        unselectedItemColor: Color(0xFF979797),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
