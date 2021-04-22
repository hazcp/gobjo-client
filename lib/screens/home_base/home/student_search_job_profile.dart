import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/components/loading_indicator.dart';
import 'package:test_app/models/Job.dart';
import 'package:test_app/models/Student.dart';
import 'package:test_app/screens/home_base/home/student_search_list.dart';
import '../../../api.dart';
import '../../../components/top_job_profile_search.dart';
import '../../../components/job_page_box.dart';
import '../../../components/standard_button.dart';
import '../../../constants.dart';

class StudentSearchJobProfile extends StatefulWidget {
  StudentSearchJobProfile({this.student, this.jobId, this.jobList});

  final Student student;
  final List<Job> jobList;
  final String jobId;

  @override
  _StudentSearchJobProfileState createState() =>
      _StudentSearchJobProfileState();
}

class _StudentSearchJobProfileState extends State<StudentSearchJobProfile> {
  Student student;
  Job job;
  bool goBack = false;
  List<Job> theJobList;

  @override
  void initState() {
    super.initState();
    goBack = false;
    student = widget.student;
    theJobList = widget.jobList;
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
        : StudentSearchList(jobList: theJobList, student: student);
  }

  Widget buildJobProfile() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TopJobProfileSearch(
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
            Row(
              children: [
                Expanded(
                  child: StandardButton(
                    textButton: 'APPLY',
                    onPressed: () {
                      apiService.createJobStatus(
                          job.id, student.id, "hasApplied");
                      print("Sucessfully Applied");
                      theJobList.removeWhere((job) => job.id == widget.jobId);
                      setState(() {
                        goBack = true;
                      });
                    },
                    colourButton: kPurpleThemeColour,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StandardButton(
                    textButton: 'BACK',
                    onPressed: () {
                      setState(() {
                        goBack = true;
                      });
                    },
                    colourButton: kGreyColour,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
