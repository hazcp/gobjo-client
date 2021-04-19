import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/components/loading_indicator.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/models/Job.dart';
import 'package:test_app/models/JobStatus.dart';
import 'package:test_app/models/Student.dart';
import 'package:test_app/screens/home_base/jobs/student_jobs_job_profile.dart';

import '../../../api.dart';
import '../../../components/applied_job_card.dart';

class StudentJobs extends StatefulWidget {
  StudentJobs({this.student});
  final Student student;

  @override
  _StudentJobsState createState() => _StudentJobsState();
}

class _StudentJobsState extends State<StudentJobs> {
  Student student;
  List<JobStatus> jobStatusList;
  List<Job> jobList;
  bool clickedOnJob = false;
  String clickedJobId = "";

  List<Widget> generateAppliedJobCards() {
    List<Widget> jobAppliedCardWidgets = [];

    for (int i = 0; i < jobList.length; i++) {
      Job thisJob = jobList[i];
      String whenJobDate =
          DateFormat("d/M/yyyy").format(DateTime.parse(thisJob.timeFrom));

      jobAppliedCardWidgets.add(
        AppliedJobCard(
          jobType: thisJob.title,
          jobEmployer: thisJob.employer,
          whenJob: whenJobDate,
          isSelected: (choice) {
            if (choice == Withdraw) {
              print('Unsave');
            } else if (choice == View) {
              setState(() {
                clickedJobId = thisJob.id;
                clickedOnJob = true;
              });
            }
          },
        ),
      );
      // add divider between job cards as long as not the last job card of list
      if (!(i + 1 == jobList.length)) {
        jobAppliedCardWidgets.add(
          Divider(
            height: 20.0,
          ),
        );
      }
    }
    return jobAppliedCardWidgets;
  }

  void getAllAppliedJobs(String studentId) async {
    List<JobStatus> jobStatusesList =
        await apiService.findAllAppliedJobs(studentId);
    setState(() {
      jobStatusList = jobStatusesList;
    });

    List<Job> theJobList = [];

    for (int i = 0; i < jobStatusList.length; i++) {
      String theJobId = jobStatusList[i].jobId;
      Job theJob = await apiService.findJob(theJobId);
      theJobList.add(theJob);
    }

    setState(() {
      jobList = theJobList;
    });
  }

  @override
  void initState() {
    clickedOnJob = false;
    student = widget.student;
    getAllAppliedJobs(student.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !clickedOnJob
        ? (jobList != null
            ? buildAppliedPage()
            : Center(child: LoadingIndicator()))
        : StudentJobsJobProfile(
            student: student,
            jobId: clickedJobId,
          );
  }

  Widget buildAppliedPage() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Your Jobs',
            style: kStudentHomeTextStyle,
          ),
          SizedBox(height: 20.0),
          Text('Applied', style: kMainPurpleBold),
          Expanded(
            child: ListView(
              children: generateAppliedJobCards(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPurpleThemeColour,
        onPressed: () {
          getAllAppliedJobs(student.id);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
