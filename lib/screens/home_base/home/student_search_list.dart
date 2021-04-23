import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/components/standard_button.dart';
import 'package:test_app/models/JobStatus.dart';
import 'package:test_app/models/Student.dart';
import 'package:test_app/screens/home_base/home/student_home.dart';
import 'package:test_app/screens/home_base/home/student_search_job_profile.dart';

import '../../../api.dart';
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
  List<JobStatus> jobStatusList;
  List<Job> jobList;
  int lengthJobList;
  bool jobListIsEmpty;
  Student student;
  bool goBack = false;
  bool clickedOnJob = false;
  String clickedJobId = "";

  List<bool> isSaved;

  List<Widget> generateJobCards() {
    List<Widget> jobCardWidgets = [];
    for (int i = 0; i < jobList.length; i++) {
      Job thisJob = jobList[i];

      jobCardWidgets.add(JobCard(
        pictureName: 'default_job.png',
        jobType: thisJob.title,
        jobEmployer: thisJob.employer,
        jobFarAway: thisJob.distanceToPostcode,
        jobWage: thisJob.wage,
        jobTimeFrom: DateFormat.Hm().format(DateTime.parse(thisJob.timeFrom)),
        jobTimeTo: DateFormat.Hm().format(DateTime.parse(thisJob.timeTo)),
        savedColour:
            thisJob.isSaved == true ? kPurpleThemeColour : Color(0xff222222),
        onPressSaved: () {
          if (thisJob.isSaved == true) {
            setState(() {
              thisJob.isSaved = false;
            });
            apiService.updateJobStatus(student.id, thisJob.id, "");
          } else if (thisJob.isSaved == false) {
            setState(() {
              thisJob.isSaved = true;
            });
            apiService.updateJobStatus(student.id, thisJob.id, "hasSaved");
          }
        },
        //^^^  parses ISO8601 format into datetime format, and uses intl to change into readable time
        onPress: () {
          setState(() {
            clickedJobId = thisJob.id;
            clickedOnJob = true;
          });
        },
      ));
      // add divider between job cards as long as not the last job card of list
      if (!(i + 1 == jobList.length)) {
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
