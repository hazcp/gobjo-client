import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';

import '../components/saved_job_card.dart';

class StudentJobsContents extends StatefulWidget {
  @override
  _StudentJobsContentsState createState() => _StudentJobsContentsState();
}

class _StudentJobsContentsState extends State<StudentJobsContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(41),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Your Jobs',
                style: kStudentHomeTextStyle,
              ),
              SizedBox(height: 20.0),
              Text('Saved', style: kMainPurpleBold),
              Divider(),
              SavedJobCard(
                jobType: 'Bar Staff',
                jobEmployer: 'Archie\'s Bar',
                whenJob: 'Today',
              ),
              Divider(),
              SavedJobCard(
                jobType: 'Bar Staff',
                jobEmployer: 'Brookhouse',
                whenJob: 'Tomorrow',
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
