import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/models/Student.dart';

import '../../../components/saved_job_card.dart';

class StudentJobs extends StatefulWidget {
  StudentJobs({this.student});
  final Student student;

  @override
  _StudentJobsState createState() => _StudentJobsState();
}

class _StudentJobsState extends State<StudentJobs> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
