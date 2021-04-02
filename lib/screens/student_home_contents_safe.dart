import 'package:flutter/material.dart';

import '../constants.dart';

import '../components/standard_outlined_button.dart';
import '../components/standard_button.dart';
import 'student_search.dart';

class StudentHomeContentsSafe extends StatefulWidget {
  @override
  _StudentHomeContentsSafeState createState() =>
      _StudentHomeContentsSafeState();
}

class _StudentHomeContentsSafeState extends State<StudentHomeContentsSafe> {
  bool isSelectedToday = false;
  bool isSelectedONW = false;
  int willingToTravel = 5;
  String willingToTravelString = 'Up to 5 miles away';

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  willingToTravelString = 'Up to $willingToTravel miles away';
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
            colourButton: kPurpleThemeColour,
          ),
        ),
      ],
    );
  }
}
