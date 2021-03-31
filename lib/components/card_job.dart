import 'package:flutter/material.dart';
import 'package:test_app/components/card_job_text.dart';

class JobCard extends StatelessWidget {
  JobCard({
    this.pictureName,
    this.jobType,
    this.jobEmployer,
    this.jobWage,
    this.jobFarAway,
    this.jobTimeFrom,
    this.jobTimeTo,
  });

  final String pictureName;
  final String jobType;
  final String jobEmployer;
  final double jobWage;
  final double jobFarAway;
  final String jobTimeFrom;
  final String jobTimeTo;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.only(left: 45),
            child: Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }
}
