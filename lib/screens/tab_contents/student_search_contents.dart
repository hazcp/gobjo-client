import 'package:flutter/material.dart';

import '../../components/card_job.dart';

import '../../constants.dart';

import '../../models/Job.dart';

class StudentSearchContents extends StatefulWidget {
  StudentSearchContents(this.jobList);

  final List<Job> jobList;

  @override
  _StudentSearchContentsState createState() => _StudentSearchContentsState();
}

class _StudentSearchContentsState extends State<StudentSearchContents> {
  List<Widget> generateJobCards() {
    List<Widget> jobCardWidgets = [];
    for (int i = 0; i < widget.jobList.length; i++) {
      Job thisJob = widget.jobList[i];
      jobCardWidgets.add(JobCard(
        pictureName: 'default_job.png',
        jobType: thisJob.title,
        jobEmployer: thisJob.employer,
        jobFarAway: 2.5,
        jobWage: thisJob.wage,
        jobTimeFrom: thisJob.timeFrom,
        jobTimeTo: thisJob.timeTo,
      ));
      // add divider between job cards as long as not the last job card of list
      if (!(i + 1 == widget.jobList.length)) {
        jobCardWidgets.add(
          Divider(
            height: 50.0,
          ),
        );
      }
    }
    return jobCardWidgets;
  }

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
                children: generateJobCards(),
              ),
              //   JobCard(
              //     pictureName: 'default_job.png',
              //     jobType: 'Bar Staff',
              //     jobEmployer: 'Weatherspoons',
              //     jobFarAway: 3.4,
              //     jobWage: 9.50,
              //     jobTimeFrom: '23:00',
              //     jobTimeTo: '06:30',
              //   ),
              //   Divider(
              //     height: 50.0,
              //   ),
              //   JobCard(
              //     pictureName: 'default_job.png',
              //     jobType: 'Bar Staff',
              //     jobEmployer: 'The Kings Hand',
              //     jobFarAway: 6,
              //     jobWage: 12.50,
              //     jobTimeFrom: '10:00',
              //     jobTimeTo: '19:00',
              //   ),
              //   Divider(
              //     height: 50.0,
              //   ),
              //   JobCard(
              //     pictureName: 'default_job.png',
              //     jobType: 'Bar Staff',
              //     jobEmployer: 'Archie\'s Bar',
              //     jobFarAway: 2.5,
              //     jobWage: 8,
              //     jobTimeFrom: '15:00',
              //     jobTimeTo: '23:30',
              //   ),
              //   Divider(
              //     height: 50.0,
              //   ),
              //   JobCard(
              //     pictureName: 'default_job.png',
              //     jobType: 'Bar Staff',
              //     jobEmployer: 'Archie\'s Bar',
              //     jobFarAway: 2.5,
              //     jobWage: 8,
              //     jobTimeFrom: '15:00',
              //     jobTimeTo: '23:30',
              //   ),
              //   Divider(
              //     height: 50.0,
              //   ),
              //   JobCard(
              //     pictureName: 'default_job.png',
              //     jobType: 'Bar Staff',
              //     jobEmployer: 'Archie\'s Bar',
              //     jobFarAway: 2.5,
              //     jobWage: 8,
              //     jobTimeFrom: '15:00',
              //     jobTimeTo: '23:30',
              //   ),
              //   Divider(
              //     height: 50.0,
              //   ),
              //   JobCard(
              //     pictureName: 'default_job.png',
              //     jobType: 'Bar Staff',
              //     jobEmployer: 'Archie\'s Bar',
              //     jobFarAway: 2.5,
              //     jobWage: 8,
              //     jobTimeFrom: '15:00',
              //     jobTimeTo: '23:30',
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
