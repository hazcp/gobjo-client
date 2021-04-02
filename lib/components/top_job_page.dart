import 'package:flutter/material.dart';
import '../constants.dart';

class TopJobPage extends StatelessWidget {
  TopJobPage();

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Archie\'s Bar',
              style: kStudentJobPageMain,
            ),
            SizedBox(height: 5),
            Text(
              'Bar Staff - Today',
              style: kSecondaryGreyBItalic,
            ),
            Text(
              'Liverpool, UK',
              style: kSecondaryGreyItalic,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Icon(Icons.bookmark),
        ),
      ],
    );
  }
}
