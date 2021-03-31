import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CardJobText extends StatelessWidget {
  CardJobText(
      {this.jobType,
      this.jobEmployer,
      this.jobWage,
      this.jobFarAway,
      this.jobTimeFrom,
      this.jobTimeTo});

  final String jobType;
  final String jobEmployer;
  final String jobWage;
  final double jobFarAway;
  final String jobTimeFrom;
  final String jobTimeTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            jobType,
            style: kStudentSearchJobMain,
          ),
          Text(
            jobEmployer,
            style: kStudentSearchJobSecondaryItalics,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: kGreyColour,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '~$jobFarAway miles away',
                          style: kStudentSearchJobSecondary,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.payments,
                          color: kGreyColour,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '£$jobWage an hour',
                          style: kStudentSearchJobSecondary,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.query_builder,
                          color: kGreyColour,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '$jobTimeFrom - $jobTimeTo',
                          style: kStudentSearchJobSecondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
