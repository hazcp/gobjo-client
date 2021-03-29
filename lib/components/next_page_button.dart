import 'package:flutter/material.dart';
import '../constants.dart';

class NextPageButton extends StatelessWidget {
  NextPageButton({this.nextPage});

  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPurpleThemeColour,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => nextPage,
          ),
        );
      },
      child: Icon(Icons.chevron_right),
    );
  }
}
