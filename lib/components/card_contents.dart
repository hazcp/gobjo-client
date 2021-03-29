import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardContents extends StatelessWidget {
  CardContents({this.textCard, this.iconCard});
  final String textCard;
  final IconData iconCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(iconCard, size: 50.0),
          Text(textCard, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
