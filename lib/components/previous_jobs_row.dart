import 'package:flutter/material.dart';
import '../constants.dart';

class PreviousJobsRow extends StatelessWidget {
  PreviousJobsRow({this.prevJobText, this.prevJobTitle, this.numOfStars});

  final String prevJobText;
  final String prevJobTitle;
  final double numOfStars;

  List<Widget> generateStars(double numOfStars) {
    List<Widget> starCombination = [];

    while (numOfStars > 0) {
      if (numOfStars == 0.5) {
        starCombination.add(
          Icon(
            Icons.star_half,
            color: kPurpleThemeColour,
          ),
        );
      } else if (numOfStars == 1) {
        starCombination.add(
          Icon(
            Icons.star,
            color: kPurpleThemeColour,
          ),
        );
      } else {
        starCombination.add(
          Icon(
            Icons.star,
            color: kPurpleThemeColour,
          ),
        );
      }
      numOfStars--;
    }

    while (starCombination.length != 3) {
      starCombination.add(
        Icon(
          Icons.star_border,
          color: kPurpleThemeColour,
        ),
      );
    }
    return starCombination;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ...generateStars(numOfStars),
        SizedBox(width: 15),
        Text('$prevJobText - ', style: kSecondaryGrey),
        Text('$prevJobTitle', style: kSecondaryGreyItalic),
      ],
    );
  }
}
