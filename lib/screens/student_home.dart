import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/standard_outlined_button.dart';
import '../components/standard_button.dart';

import 'student_search.dart';

import '../constants.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  bool isSelectedToday = false;
  bool isSelectedONW = false;
  int willingToTravel = 5;
  String willingToTravelString = 'Up to 5 miles away';

  int selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'When do you want to work?',
                  style: kStudentHomeTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 40.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: StandardOutlinedButton(
                        textButton: 'TODAY',
                        buttonTextColour:
                            isSelectedToday ? Colors.white : kPurpleThemeColour,
                        buttonColour:
                            isSelectedToday ? kPurpleThemeColour : Colors.white,
                        onPressed: () {
                          setState(() {
                            if (isSelectedToday) {
                              isSelectedToday = false;
                            } else {
                              isSelectedToday = true;
                              isSelectedONW = false;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: StandardOutlinedButton(
                        textButton: 'OVER NEXT WEEK',
                        buttonTextColour:
                            isSelectedONW ? Colors.white : kPurpleThemeColour,
                        buttonColour:
                            isSelectedONW ? kPurpleThemeColour : Colors.white,
                        onPressed: () {
                          setState(
                            () {
                              if (isSelectedONW) {
                                isSelectedONW = false;
                              } else {
                                isSelectedONW = true;
                                isSelectedToday = false;
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'How far are you willing to travel?',
                  style: kStudentHomeTextStyle,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: kPurpleThemeColour,
                  inactiveTrackColor: kPurpleThemeColourTransparent,
                  thumbColor: Color(0xFF018786),
                  overlayColor: kPurpleThemeColourTransparent,
                ),
                child: Slider(
                  value: willingToTravel.toDouble(),
                  min: 1.0,
                  max: 10.0,
                  onChanged: (double newValue) {
                    setState(() {
                      willingToTravel = newValue.round();
                      if (willingToTravel == 10) {
                        willingToTravelString = 'Greater than 10 miles away';
                      } else if (willingToTravel == 1) {
                        willingToTravelString =
                            'Less than $willingToTravel mile away';
                      } else {
                        willingToTravelString =
                            'Up to $willingToTravel miles away';
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                willingToTravelString,
                style: kWillingToTravelStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: StandardButton(
                  textButton: 'FIND JOBS FOR ME',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentSearch(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
