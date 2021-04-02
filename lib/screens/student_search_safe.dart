import 'package:flutter/material.dart';

import '../components/card_job.dart';

import '../constants.dart';

class StudentSearchSafe extends StatefulWidget {
  @override
  _StudentSearchSafeState createState() => _StudentSearchSafeState();
}

class _StudentSearchSafeState extends State<StudentSearchSafe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              'Here are some jobs for you...',
              style: kStudentHomeTextStyle,
            ),
            SizedBox(height: 40.0),
            Expanded(
              child: ListView(
                children: <Widget>[
                  JobCard(
                    pictureName: 'default_job.png',
                    jobType: 'Bar Staff',
                    jobEmployer: 'Archie\'s Bar',
                    jobFarAway: 2.5,
                    jobWage: 8,
                    jobTimeFrom: '15:00',
                    jobTimeTo: '23:30',
                  ),
                  Divider(
                    height: 50.0,
                  ),
                  JobCard(
                    pictureName: 'default_job.png',
                    jobType: 'Bar Staff',
                    jobEmployer: 'Weatherspoons',
                    jobFarAway: 3.4,
                    jobWage: 9.50,
                    jobTimeFrom: '23:00',
                    jobTimeTo: '06:30',
                  ),
                  Divider(
                    height: 50.0,
                  ),
                  JobCard(
                    pictureName: 'default_job.png',
                    jobType: 'Bar Staff',
                    jobEmployer: 'The Kings Hand',
                    jobFarAway: 6,
                    jobWage: 12.50,
                    jobTimeFrom: '10:00',
                    jobTimeTo: '19:00',
                  ),
                  Divider(
                    height: 50.0,
                  ),
                  JobCard(
                    pictureName: 'default_job.png',
                    jobType: 'Bar Staff',
                    jobEmployer: 'Archie\'s Bar',
                    jobFarAway: 2.5,
                    jobWage: 8,
                    jobTimeFrom: '15:00',
                    jobTimeTo: '23:30',
                  ),
                  Divider(
                    height: 50.0,
                  ),
                  JobCard(
                    pictureName: 'default_job.png',
                    jobType: 'Bar Staff',
                    jobEmployer: 'Archie\'s Bar',
                    jobFarAway: 2.5,
                    jobWage: 8,
                    jobTimeFrom: '15:00',
                    jobTimeTo: '23:30',
                  ),
                  Divider(
                    height: 50.0,
                  ),
                  JobCard(
                    pictureName: 'default_job.png',
                    jobType: 'Bar Staff',
                    jobEmployer: 'Archie\'s Bar',
                    jobFarAway: 2.5,
                    jobWage: 8,
                    jobTimeFrom: '15:00',
                    jobTimeTo: '23:30',
                  ),
                  Divider(
                    height: 50.0,
                  ),
                  JobCard(
                    pictureName: 'default_job.png',
                    jobType: 'Bar Staff',
                    jobEmployer: 'Archie\'s Bar',
                    jobFarAway: 2.5,
                    jobWage: 8,
                    jobTimeFrom: '15:00',
                    jobTimeTo: '23:30',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
