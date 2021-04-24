import 'package:flutter/material.dart';
import 'package:test_app/models/Student.dart';
import 'student_edit_profile.dart';
import '../../../constants.dart';

import '../../../components/previous_jobs_row.dart';
import '../../../components/standard_button.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile({this.student});
  final Student student;

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  String studentName;
  String studentUniversity;
  int studentAge;
  bool studentIBS;
  bool studentIW;
  bool studentIKP;
  bool isEditingProfile;

  @override
  void initState() {
    isEditingProfile = false;
    studentName = widget.student.name;
    studentUniversity = widget.student.university;
    studentAge = widget.student.age;
    studentIBS = widget.student.isBarStaff;
    studentIW = widget.student.isWaiter;
    studentIKP = widget.student.isKitchenPorter;
    super.initState();
  }

  String generateExperience() {
    String resultantExperience = "";
    if (studentIBS == true) {
      resultantExperience += "Bar Staff, ";
    }
    if (studentIW == true) {
      resultantExperience += "Waiter, ";
    }
    if (studentIKP == true) {
      resultantExperience += "Kitchen Porter, ";
    }
    String resultantExperienceA =
        resultantExperience.substring(0, resultantExperience.lastIndexOf(", "));

    return resultantExperienceA;
  }

  Widget buildProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 63,
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$studentName', style: kStudentJobPageMain),
                  Text('Student at $studentUniversity',
                      style: kMainGreyBItalic),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        Row(
          children: <Widget>[
            Text('Age: ', style: kSecondaryGreyBold),
            Text('$studentAge', style: kSecondaryGrey),
          ],
        ),
        SizedBox(height: 7),
        Row(
          children: <Widget>[
            Text('Experience: ', style: kSecondaryGreyBold),
            Text(generateExperience(), style: kSecondaryGrey),
          ],
        ),
        SizedBox(height: 25),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Previous Jobs: ', style: kSecondaryGreyBold),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: Column(
                children: <Widget>[
                  PreviousJobsRow(
                    prevJobText: 'Archie\'s Bar',
                    prevJobTitle: 'Bar Staff',
                    numOfStars: 2.5,
                  ),
                  PreviousJobsRow(
                    prevJobText: 'Weatherspoons',
                    prevJobTitle: 'Bar Staff',
                    numOfStars: 3,
                  ),
                  PreviousJobsRow(
                    prevJobText: 'The Kings Hand',
                    prevJobTitle: 'Bar Staff',
                    numOfStars: 2,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                width: 154,
                height: 36,
                child: StandardButton(
                  colourButton: kPurpleThemeColour,
                  textButton: 'EDIT PROFILE',
                  onPressed: () {
                    setState(() {
                      isEditingProfile = true;
                    });
                    // Navigator.pushReplacement(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, animation1, animation2) =>
                    //         StudentEditProfile(),
                    //     transitionDuration: Duration(seconds: 0),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return !isEditingProfile
        ? buildProfile()
        : StudentEditProfile(
            student: widget.student,
          );
  }
}
