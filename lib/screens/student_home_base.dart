import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/Student.dart';

import 'home_base/jobs/student_jobs.dart';
import 'home_base/profile/student_profile.dart';
import 'home_base/home/student_home.dart';

import '../constants.dart';

class StudentHomeBase extends StatefulWidget {
  StudentHomeBase(this.student);

  final Student student;

  @override
  _StudentHomeBaseState createState() => _StudentHomeBaseState();
}

class _StudentHomeBaseState extends State<StudentHomeBase> {
  int selectedTabIndex = 1;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: selectedTabIndex, viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          // pageSnapping: true,
          // physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(41.0),
                child: StudentJobs(student: widget.student)),
            Padding(
                padding: EdgeInsets.all(41.0),
                child: StudentHome(student: widget.student)),
            Padding(
                padding: EdgeInsets.all(41.0),
                child: StudentProfile(student: widget.student)),
          ],
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
        currentIndex: selectedTabIndex,
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
            pageController.animateToPage(selectedTabIndex,
                duration: Duration(milliseconds: 250),
                curve: Curves.fastOutSlowIn);
          });
        },
      ),
    );
  }
}
