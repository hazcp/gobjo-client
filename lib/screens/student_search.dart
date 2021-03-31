import 'package:flutter/material.dart';

import '../components/card_job.dart';

import '../constants.dart';

class StudentSearch extends StatefulWidget {
  @override
  _StudentSearchState createState() => _StudentSearchState();
}

class _StudentSearchState extends State<StudentSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(41),
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
      ),
    );
  }
}
