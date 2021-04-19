import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/components/loading_indicator.dart';
import 'package:test_app/models/Job.dart';
import 'package:test_app/models/Student.dart';
import 'package:test_app/screens/home_base/jobs/student_jobs.dart';
import '../../../api.dart';
import '../../../components/top_search_job.dart';
import '../../../components/job_page_box.dart';
import '../../../components/standard_button.dart';
import '../../../constants.dart';

class StudentJobsJobProfile extends StatefulWidget {
  StudentJobsJobProfile({this.student, this.jobId});

  final Student student;
  final String jobId;

  @override
  _StudentJobsJobProfileState createState() => _StudentJobsJobProfileState();
}

class _StudentJobsJobProfileState extends State<StudentJobsJobProfile> {
  Student student;
  Job job;
  bool goBack;

  @override
  void initState() {
    super.initState();
    student = widget.student;
    goBack = false;
    getJob(widget.jobId);
  }

  void getJob(String jobId) async {
    Job theJob = await apiService.findJob(widget.jobId);
    setState(() {
      job = theJob;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !goBack
        ? (job != null ? buildJobProfile() : Center(child: LoadingIndicator()))
        : StudentJobs(student: student);
  }

  Widget buildJobProfile() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TopSearchJob(
              jobTitle: job.title,
              jobEmployer: job.employer,
              jobLocation: job.location,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                JobPageBox(
                  boxIcon: Icons.query_builder,
                  boxTitle: 'Shift',
                  boxText:
                      '${DateFormat.Hm().format(DateTime.parse(job.timeFrom))} - ${DateFormat.Hm().format(DateTime.parse(job.timeTo))}',
                ),
                SizedBox(width: 80),
                JobPageBox(
                  boxIcon: Icons.payments,
                  boxTitle: 'Salary',
                  boxText: '£${job.wage.toStringAsFixed(2)} an hour',
                ),
              ],
            ),
            SizedBox(height: 30),
            JobPageBox(
              boxIcon: Icons.location_on,
              boxTitle: 'Location',
              boxText: '${job.location}',
            ),
            SizedBox(height: 30),
            JobPageBox(
              boxIcon: Icons.description,
              boxTitle: 'Description',
              boxText: '${job.description}',
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                StandardButton(
                  textButton: 'WITHDRAW APPLICATION',
                  onPressed: () {
                    print('WITHDRAW APPLICATION');
                  },
                  colourButton: kPurpleThemeColour,
                ),
                StandardButton(
                  textButton: 'BACK',
                  onPressed: () {
                    setState(() {
                      goBack = true;
                    });
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return StudentJobs(student: student);
                    //     },
                    //   ),
                    // );
                  },
                  colourButton: kGreyColour,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
