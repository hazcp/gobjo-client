import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tab_contents/student_profile_contents.dart';

import '../constants.dart';

class StudentHubSearch extends StatefulWidget {
  @override
  _StudentHubSearchState createState() => _StudentHubSearchState();
}

class _StudentHubSearchState extends State<StudentHubSearch> {
  int selectedIndex = 1;

  static List<Widget> widgetOptions = <Widget>[
    Text(
      'HERE',
    ),
    Text(
      'HERE',
    ),
    StudentProfileContents(),
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
