import 'package:flutter/material.dart';
import '../../components/top_search_job.dart';
import '../../components/job_page_box.dart';
import '../../components/standard_button.dart';
import '../../constants.dart';

class StudentSearchJobContents extends StatefulWidget {
  @override
  _StudentSearchJobContentsState createState() =>
      _StudentSearchJobContentsState();
}

class _StudentSearchJobContentsState extends State<StudentSearchJobContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(41),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TopSearchJob(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  JobPageBox(
                    boxIcon: Icons.query_builder,
                    boxTitle: 'Shift',
                    boxText: '14:00 - 23:30',
                  ),
                  SizedBox(width: 80),
                  JobPageBox(
                    boxIcon: Icons.payments,
                    boxTitle: 'Salary',
                    boxText: '£8.00 an hour',
                  ),
                ],
              ),
              SizedBox(height: 30),
              JobPageBox(
                boxIcon: Icons.location_on,
                boxTitle: 'Location',
                boxText:
                    'Central Railway Station, Ranelagh St, Liverpool L1 1QE',
              ),
              SizedBox(height: 30),
              JobPageBox(
                boxIcon: Icons.description,
                boxTitle: 'Description',
                boxText:
                    'Looking to recruit someone who has had prior experience working on a bar. Needs experience preparing alcoholic (and non-alcoholic) beverages, making cocktails and interacting with customers. \n\nWear white shirt and smart jeans. Arrive at least 20 minutes before the shift',
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: StandardButton(
                      textButton: 'APPLY',
                      onPressed: () {
                        print('PRESSED');
                      },
                      colourButton: kPurpleThemeColour,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StandardButton(
                      textButton: 'BACK',
                      onPressed: () {
                        print('PRESSED');
                      },
                      colourButton: kGreyColour,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
