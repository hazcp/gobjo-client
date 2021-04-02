import 'package:flutter/material.dart';
import '../constants.dart';

class JobPageBox extends StatelessWidget {
  JobPageBox({this.boxTitle, this.boxIcon, this.boxText});

  final String boxTitle;
  final IconData boxIcon;
  final String boxText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              boxIcon,
              color: kGreyColour,
            ),
            SizedBox(width: 5),
            Text(
              boxTitle,
              style: kSecondaryGreyBold,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            boxText,
            style: kSecondaryGrey,
          ),
        ),
      ],
    );
  }
}
