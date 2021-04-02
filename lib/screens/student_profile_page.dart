import 'package:flutter/material.dart';
import '../constants.dart';

import '../components/previous_jobs_row.dart';
import '../components/standard_button.dart';

class StudentProfilePage extends StatefulWidget {
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(41.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 63,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Harrison Porter', style: kStudentJobPageMain),
                        Text('Student at University of Liverpool',
                            style: kMainGreyBItalic),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: <Widget>[
                  Text('Age: ', style: kSecondaryGreyBold),
                  Text('21', style: kSecondaryGrey),
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: <Widget>[
                  Text('Experience: ', style: kSecondaryGreyBold),
                  Text('Bar Staff, Waiter', style: kSecondaryGrey),
                ],
              ),
              SizedBox(height: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Previous Jobs: ', style: kSecondaryGreyBold),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Column(
                      children: <Widget>[
                        PreviousJobsRow(
                          prevJobText: 'Archie\'s Bar',
                          prevJobTitle: 'Bar Staff',
                          numOfStars: 2.5,
                        ),
                        PreviousJobsRow(
                          prevJobText: 'Weatherspoons',
                          prevJobTitle: 'Bar Staff',
                          numOfStars: 3,
                        ),
                        PreviousJobsRow(
                          prevJobText: 'The Kings Hand',
                          prevJobTitle: 'Bar Staff',
                          numOfStars: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Container(
                      width: 154,
                      height: 36,
                      child: StandardButton(
                        colourButton: kPurpleThemeColour,
                        textButton: 'EDIT PROFILE',
                        onPressed: () {
                          print('TO EDIT PROFILE');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
