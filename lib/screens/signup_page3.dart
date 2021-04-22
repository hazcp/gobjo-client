import 'package:flutter/material.dart';
import 'package:test_app/components/bottom_progress_row.dart';
import 'package:test_app/components/next_page_button.dart';
import 'package:test_app/components/prev_page_button.dart';
import 'package:test_app/models/Student.dart';

import '../api.dart';

import '../components/background.dart';
import '../components/bottom_progress_row.dart';
import '../components/card_contents.dart';

import '../constants.dart';

class SignUpPage3 extends StatefulWidget {
  SignUpPage3(this.student);

  final Student student;

  @override
  _SignUpPage3State createState() => _SignUpPage3State();
}

class _SignUpPage3State extends State<SignUpPage3> {
  bool isBarStaff = false; // change this when have time
  bool isKitchenPorter = false; // change this when have time
  bool isWaiter = false; // change this when have time
  Color cardColour = Colors.white;
  String studentFirstName;
  int counter;

  @override
  void initState() {
    String studentName = widget.student.name;
    var parts = studentName.split(" ");
    studentFirstName = parts[0].trim();
    counter = 0;
    super.initState();
  }

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
                      'Hi $studentFirstName,', // use first name here
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
                              color: isBarStaff
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
                                if (!isBarStaff) {
                                  isBarStaff = true;
                                  counter++;
                                } else {
                                  isBarStaff = false;
                                  counter--;
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
                              color: isKitchenPorter
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
                                if (!isKitchenPorter) {
                                  isKitchenPorter = true;
                                  counter++;
                                } else {
                                  isKitchenPorter = false;
                                  counter--;
                                }
                              });
                            },
                            child: CardContents(
                              textCard: 'Kitchen Porter',
                              iconCard: Icons.countertops,
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color:
                                  isWaiter ? kPurpleThemeColour : Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          elevation: 3,
                          child: InkWell(
                            splashColor: kPurpleThemeColour,
                            onTap: () {
                              setState(() {
                                if (!isWaiter) {
                                  isWaiter = true;
                                  counter++;
                                } else {
                                  isWaiter = false;
                                  counter--;
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
          floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: PrevPageButton(
                    onPress: () {
                      apiService.updateStudent(
                        widget.student.id,
                        {"pageNumber": 2},
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: NextPageButton(
                    onPress: () {
                      if (counter < 1) {
                        _showMyDialog();
                      } else {
                        apiService.updateStudent(
                          widget.student.id,
                          {
                            "isBarStaff": isBarStaff,
                            "isKitchenPorter": isKitchenPorter,
                            "isWaiter": isWaiter,
                            "pageNumber": 4
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please choose at least one option.'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok', style: TextStyle(color: kPurpleThemeColour)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
