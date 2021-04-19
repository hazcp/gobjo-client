import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/components/standard_button.dart';
import 'package:test_app/models/Student.dart';
import 'package:test_app/screens/home_base/home/student_home.dart';
import 'package:test_app/screens/home_base/home/student_search_job_profile.dart';

import '../../../components/card_job.dart';

import '../../../constants.dart';

import '../../../models/Job.dart';

class StudentSearchList extends StatefulWidget {
  StudentSearchList({this.jobList, this.student});

  final List<Job> jobList;
  final Student student;

  @override
  _StudentSearchListState createState() => _StudentSearchListState();
}

class _StudentSearchListState extends State<StudentSearchList> {
  List<Job> jobList;
  int lengthJobList;
  bool jobListIsEmpty;
  Student student;
  bool goBack = false;
  bool clickedOnJob = false;
  String clickedJobId = "";

  List<Widget> generateJobCards() {
    List<Widget> jobCardWidgets = [];
    for (int i = 0; i < widget.jobList.length; i++) {
      Job thisJob = widget.jobList[i];
      jobCardWidgets.add(JobCard(
        pictureName: 'default_job.png',
        jobType: thisJob.title,
        jobEmployer: thisJob.employer,
        jobFarAway: thisJob.distanceToPostcode,
        jobWage: thisJob.wage,
        jobTimeFrom: DateFormat.Hm().format(DateTime.parse(thisJob.timeFrom)),
        jobTimeTo: DateFormat.Hm().format(DateTime.parse(thisJob.timeTo)),
        //^^^  parses ISO8601 format into datetime format, and uses intl to change into readable time
        onPress: () {
          setState(() {
            clickedJobId = thisJob.id;
            clickedOnJob = true;
          });
        },
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
  void initState() {
    clickedOnJob = false;
    student = widget.student;
    jobList = widget.jobList;
    lengthJobList = jobList.length;
    if (lengthJobList != 0) {
      jobListIsEmpty = false;
    } else {
      jobListIsEmpty = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      !clickedOnJob
          ? (!goBack
              ? (!jobListIsEmpty ? buildJobList() : buildNoJobsAvailable())
              : StudentHome(student: student))
          : StudentSearchJobProfile(
              student: student,
              jobId: clickedJobId,
              jobList: jobList,
            ),
      //   !jobListIsEmpty
      //   ? buildJobList()
      //   : buildNoJobsAvailable(
      //TODO: sort by distance closest to furthest
    ]);
  }

  Widget buildJobList() {
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNoJobsAvailable() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'There are no jobs available with those search parameters.',
              style: kStudentHomeTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            StandardButton(
              textButton: 'SEARCH AGAIN',
              onPressed: () {
                setState(() {
                  goBack = true;
                });
              },
              colourButton: kPurpleThemeColour,
            ),
          ],
        ),
      ),
    );
  }
}
