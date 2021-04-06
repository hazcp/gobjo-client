import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/models/Student.dart';

import '../api.dart';
import '../components/background.dart';
import '../components/bottom_progress_row.dart';
import '../components/next_page_button.dart';

class SignUpPage2 extends StatefulWidget {
  SignUpPage2(this.student);

  final Student student;

  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  List<String> unis = [
    'University of Liverpool',
    'University of Manchester',
    'University of Bristol',
    'University of Durham',
    'University of Exeter',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '11',
    '23',
    '333',
    '444',
    '555',
  ];
  String selectedUniversity;

  @override
  Widget build(BuildContext context) {
    final _postcodeController = TextEditingController();
    final _ageController = TextEditingController();

    return Stack(
      children: <Widget>[
        Background(),
        Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(41.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(flex: 1),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What is your postcode?',
                      style: kSignUpTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: TextFormField(
                      controller: _postcodeController,
                      decoration: InputDecoration(
                        labelText: '',
                        border: OutlineInputBorder(),
                      ),
                      textCapitalization: TextCapitalization.characters,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What university do you go to?',
                      style: kSignUpTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: DropdownButton<String>(
                        value: selectedUniversity,
                        hint: Text('Please choose your University'),
                        underline: Container(
                          height: 2,
                          color: kPurpleThemeColour,
                        ),
                        isExpanded: true,
                        items: unis.map((university) {
                          return DropdownMenuItem(
                            value: university,
                            child: Text(university),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedUniversity = val;
                          });
                        }),
                  ),
                  // CustomDropdownButton(
                  //     isDense: true,
                  //     hint: Text('Select your University'),
                  //     value: selectedUniversity,
                  //     items: unis.map((university) {
                  //       return DropdownMenuItem(
                  //         value: university,
                  //         child: Text(university),
                  //       );
                  //     }).toList(),
                  //     onChanged: (val) {
                  //       setState(() {
                  //         selectedUniversity = val;
                  //       });
                  //     }),
                  Spacer(flex: 3),
                  BottomProgressRow(
                    fractionProgress: 0.5,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: NextPageButton(
            onPress: () {
              String postcode = _postcodeController.text;

              apiService.updateStudent(
                widget.student.id,
                {"postcode": postcode, "pageNumber": 3},
              );
            },
          ),
        ),
      ],
    );
  }
}
