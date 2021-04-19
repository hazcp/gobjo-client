import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';

class AppliedJobCard extends StatelessWidget {
  AppliedJobCard(
      {this.jobEmployer, this.jobType, this.whenJob, this.isSelected});

  final String jobType;
  final String jobEmployer;
  final String whenJob;
  final Function isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/default_job.png',
            width: 100,
            height: 53,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              width: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(jobType, style: kMainGreyBold),
                  Text(jobEmployer, style: kSecondaryGrey),
                  SizedBox(height: 5),
                  Text(whenJob, style: kSecondaryPurple),
                ],
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Expanded(
            child: PopupMenuButton<String>(
              icon: Icon(
                Icons.arrow_drop_down,
                color: kGreyColour,
                size: 30,
              ),
              onSelected: isSelected,
              itemBuilder: (BuildContext context) {
                return savedChoices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
