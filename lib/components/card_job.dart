import 'package:flutter/material.dart';
import 'package:test_app/components/card_job_text.dart';

class JobCard extends StatelessWidget {
  JobCard(
      {this.pictureName,
      this.jobType,
      this.jobEmployer,
      this.jobWage,
      this.jobFarAway,
      this.jobTimeFrom,
      this.jobTimeTo,
      this.onPress,
      this.onPressSaved,
      this.savedColour});

  final String pictureName;
  final String jobType;
  final String jobEmployer;
  final double jobWage;
  final double jobFarAway;
  final String jobTimeFrom;
  final String jobTimeTo;
  final Function onPress;
  final Function onPressSaved;
  final Color savedColour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/$pictureName',
              width: 100,
              height: 53,
            ),
            CardJobText(
              jobType: jobType,
              jobEmployer: jobEmployer,
              jobWage: jobWage.toStringAsFixed(2),
              jobFarAway: jobFarAway,
              jobTimeFrom: jobTimeFrom,
              jobTimeTo: jobTimeTo,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: GestureDetector(
                onTap: onPressSaved,
                child: Icon(Icons.bookmark, color: savedColour),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
