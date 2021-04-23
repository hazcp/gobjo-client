import 'package:flutter/material.dart';
import '../constants.dart';

class TopJobProfileSearch extends StatelessWidget {
  TopJobProfileSearch(
      {this.jobTitle,
      this.jobEmployer,
      this.jobLocation,
      this.onPressSaved,
      this.savedColour});

  final String jobTitle;
  final String jobEmployer;
  final String jobLocation;
  final Function onPressSaved;
  final Color savedColour;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'assets/default_job.png',
          width: 100,
          height: 53,
        ),
        SizedBox(
          width: 20.0,
        ),
        Container(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobTitle,
                style: kStudentJobPageMain,
              ),
              SizedBox(height: 5),
              Text(
                jobEmployer,
                style: kSecondaryGreyBItalic,
              ),
              Text(
                jobLocation,
                style: kSecondaryGreyItalic,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 33),
          child: GestureDetector(
            onTap: onPressSaved,
            child: Icon(Icons.bookmark, color: savedColour),
          ),
        ),
      ],
    );
  }
}
