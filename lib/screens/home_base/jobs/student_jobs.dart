import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/components/loading_indicator.dart';
import 'package:test_app/components/saved_job_card.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/models/Job.dart';
import 'package:test_app/models/JobStatus.dart';
import 'package:test_app/models/Student.dart';
import 'package:test_app/screens/home_base/jobs/student_jobs_applied_job_profile.dart';
import 'package:test_app/screens/home_base/jobs/student_jobs_saved_job_profile.dart';

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
  List<Job> jobAppliedList;
  List<Job> jobSavedList;

  bool clickedOnJobSaved = false;
  bool clickedOnJobApplied = false;
  String clickedJobId = "";

  List<Widget> generateAppliedJobCards() {
    List<Widget> jobAppliedCardWidgets = [];

    for (int i = 0; i < jobAppliedList.length; i++) {
      Job thisJob = jobAppliedList[i];
      String whenJobDate =
          DateFormat("d/M/yyyy").format(DateTime.parse(thisJob.timeFrom));

      jobAppliedCardWidgets.add(
        AppliedJobCard(
          jobType: thisJob.title,
          jobEmployer: thisJob.employer,
          whenJob: whenJobDate,
          isSelected: (choice) {
            if (choice == Withdraw) {
              apiService.updateJobStatus(student.id, thisJob.id, "");
              findAllJobsWithStatusX(student.id, "hasApplied");
            } else if (choice == View) {
              setState(() {
                clickedJobId = thisJob.id;
                clickedOnJobApplied = true;
              });
            }
          },
        ),
      );
      // add divider between job cards as long as not the last job card of list
      if (!(i + 1 == jobAppliedList.length)) {
        jobAppliedCardWidgets.add(
          Divider(
            height: 20.0,
          ),
        );
      }
    }
    return jobAppliedCardWidgets;
  }

  List<Widget> generateSavedJobCards() {
    List<Widget> jobSavedCardWidgets = [];

    for (int i = 0; i < jobSavedList.length; i++) {
      Job thisJob = jobSavedList[i];
      String whenJobDate =
          DateFormat("d/M/yyyy").format(DateTime.parse(thisJob.timeFrom));

      jobSavedCardWidgets.add(
        SavedJobCard(
          jobType: thisJob.title,
          jobEmployer: thisJob.employer,
          whenJob: whenJobDate,
          isSelected: (choice) {
            if (choice == Unsave) {
              apiService.updateJobStatus(student.id, thisJob.id, "");
              findAllJobsWithStatusX(student.id, "hasSaved");
            } else if (choice == View) {
              setState(() {
                clickedJobId = thisJob.id;
                clickedOnJobSaved = true;
              });
            }
          },
        ),
      );
      // add divider between job cards as long as not the last job card of list
      if (!(i + 1 == jobSavedList.length)) {
        jobSavedCardWidgets.add(
          Divider(
            height: 20.0,
          ),
        );
      }
    }
    return jobSavedCardWidgets;
  }

  void findAllJobsWithStatusX(String studentId, String jobStatus) async {
    List<JobStatus> jobStatusesList =
        await apiService.findAllJobsWithStatusX(studentId, jobStatus);
    setState(() {
      jobStatusList = jobStatusesList;
    });

    List<Job> theJobList = [];

    for (int i = 0; i < jobStatusList.length; i++) {
      String theJobId = jobStatusList[i].jobId;
      Job theJob = await apiService.findJob(theJobId, student.id);
      theJobList.add(theJob);
    }
    if (jobStatus == "hasApplied") {
      setState(() {
        jobAppliedList = theJobList;
      });
    } else if (jobStatus == "hasSaved") {
      setState(() {
        jobSavedList = theJobList;
      });
    }
  }

  @override
  void initState() {
    clickedOnJobSaved = false;
    clickedOnJobApplied = false;
    student = widget.student;
    findAllJobsWithStatusX(student.id, "hasApplied");
    findAllJobsWithStatusX(student.id, "hasSaved");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !clickedOnJobSaved
        ? (!clickedOnJobApplied
            ? ((jobSavedList != null && jobAppliedList != null)
                ? buildJobPage()
                : Center(child: LoadingIndicator()))
            : StudentJobsAppliedJobProfile(
                student: student,
                jobId: clickedJobId,
              ))
        : StudentJobsSavedJobProfile(
            student: student,
            jobId: clickedJobId,
          );
  }

  Widget buildJobPage() {
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
          buildAppliedContent(),
          SizedBox(height: 20.0),
          Text('Saved', style: kMainPurpleBold),
          buildSavedContent(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kPurpleThemeColour,
      //   onPressed: () {
      //     findAllJobsWithStatusX(student.id, "hasApplied");
      //     findAllJobsWithStatusX(student.id, "hasSaved");
      //   },
      //   child: Icon(Icons.refresh),
      // ),
    );
  }

  Widget buildAppliedContent() {
    return Expanded(
      child: ListView(
        children: generateAppliedJobCards(),
      ),
    );
  }

  Widget buildSavedContent() {
    return Expanded(
      child: ListView(
        children: generateSavedJobCards(),
      ),
    );
  }
}
