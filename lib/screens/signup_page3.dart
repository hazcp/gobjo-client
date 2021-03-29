import 'package:flutter/material.dart';
import 'package:test_app/components/bottom_progress_row.dart';

import '../components/background.dart';
import '../components/bottom_progress_row.dart';
import '../components/card_contents.dart';

import '../constants.dart';

class SignUpPage3 extends StatefulWidget {
  @override
  _SignUpPage3State createState() => _SignUpPage3State();
}

class _SignUpPage3State extends State<SignUpPage3> {
  bool isSelectedTwo = false; // change this when have time
  bool isSelectedOne = false; // change this when have time
  bool isSelectedThree = false; // change this when have time
  Color cardColour = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(41.0),
              child: Column(
                children: <Widget>[
                  Spacer(flex: 1),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hi Haz,', // use first name here
                      style: kBigSignUpTextStyle,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What experience do you have?', // use first name here
                      style: kSignUpTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: isSelectedOne
                                  ? kPurpleThemeColour
                                  : Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          elevation: 3,
                          child: InkWell(
                            splashColor: kPurpleThemeColour,
                            onTap: () {
                              setState(() {
                                if (!isSelectedOne) {
                                  isSelectedOne = true;
                                } else {
                                  isSelectedOne = false;
                                }
                              });
                            },
                            child: CardContents(
                              textCard: 'Bar Staff',
                              iconCard: Icons.sports_bar,
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: isSelectedTwo
                                  ? kPurpleThemeColour
                                  : Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          elevation: 3,
                          child: InkWell(
                            splashColor: kPurpleThemeColour,
                            onTap: () {
                              setState(() {
                                if (!isSelectedTwo) {
                                  isSelectedTwo = true;
                                } else {
                                  isSelectedTwo = false;
                                }
                              });
                            },
                            child: CardContents(
                              textCard: 'Kitchen Porter',
                              iconCard: Icons.sports_bar,
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: isSelectedThree
                                  ? kPurpleThemeColour
                                  : Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          elevation: 3,
                          child: InkWell(
                            splashColor: kPurpleThemeColour,
                            onTap: () {
                              setState(() {
                                if (!isSelectedThree) {
                                  isSelectedThree = true;
                                } else {
                                  isSelectedThree = false;
                                }
                              });
                            },
                            child: CardContents(
                              textCard: 'Waiter',
                              iconCard: Icons.menu_book,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 3),
                  BottomProgressRow(
                    fractionProgress: 0.75,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.chevron_right),
            backgroundColor: kPurpleThemeColour,
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/student_home',
              );
            },
          ),
        ),
      ],
    );
  }
}
