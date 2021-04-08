import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/components/prev_page_button.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/models/Student.dart';

import '../api.dart';
import '../components/background.dart';
import '../components/bottom_progress_row.dart';
import '../components/next_page_button.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class SignUpPage2 extends StatefulWidget {
  SignUpPage2(this.student);

  final Student student;

  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  List<String> unis = [
    'University of the Arts London',
    'Anglia Ruskin University',
    'Aston University',
    'Bath Spa University',
    'Birkbeck College',
    'Birmingham City University',
    'Bishop Grosseteste University',
    'Bournemouth University',
    'Brunel University',
    'University College Birmingham',
    'University College for the Creative Arts',
    'University College London',
    'University of Bath',
    'University of Bedfordshire',
    'University of Birmingham',
    'University of Bolton',
    'University of Bradford',
    'University of Brighton',
    'University of Bristol',
    'Buckinghamshire New University',
    'Canterbury Christ Church University',
    'University of Cambridge',
    'University of Central Lancashire',
    'University of Chester',
    'University of Chichester',
    'Central School of Speech and Drama',
    'City, University of London',
    'College of St Mark & St John',
    'Conservatoire for Dance and Drama',
    'Coventry University',
    'Cranfield University',
    'University of Derby',
    'University of Durham',
    'De Montfort University',
    'University of East Anglia',
    'University of East London',
    'University of Essex',
    'University of Exeter',
    'Edge Hill University',
    'University of Gloucestershire',
    'University of Greenwich',
    'Goldsmiths College, University of London',
    'University of Hertfordshire',
    'University of Huddersfield',
    'University of Hull',
    'Harper Adams University',
    'Imperial College of Science, Technology and Medicine',
    'Institute of Cancer Research',
    'Institute of Education',
    'King\'s College London',
    'University of Keele',
    'University of Kent',
    'Kingston University',
    'Leeds Beckett University',
    'Leeds Trinity University',
    'Liverpool Hope University',
    'Liverpool John Moores University',
    'London Business School',
    'London Metropolitan University',
    'London School of Economics and Political Science',
    'London School of Hygiene & Tropical Medicine',
    'London South Bank University',
    'University of Lancaster',
    'University of Leeds',
    'University of Leicester',
    'University of Lincoln',
    'University of Liverpool',
    'University of London',
    'Loughborough University',
    'University of Manchester',
    'Middlesex University',
    'Newman University, Birmingham',
    'Northern School of Contemporary Dance',
    'University of Newcastle Upon Tyne',
    'University of Northampton',
    'University of Northumbria At Newcastle',
    'University of Nottingham',
    'Norwich University of the Arts',
    'Oxford Brookes University',
    'University of Oxford',
    'University of Plymouth',
    'University of Portsmouth',
    'Queen Mary and Westfield College',
    'University of Reading',
    'Ravensbourne',
    'Roehampton University',
    'Rose Bruford College',
    'Royal Academy of Music',
    'Royal Agricultural University',
    'Royal College of Art',
    'Royal College of Music',
    'Royal Holloway and Bedford New College',
    'Royal Northern College of Music',
    'University of Salford',
    'University of Sheffield',
    'University of Southampton',
    'University of Sunderland',
    'University of Surrey',
    'University of Sussex',
    'School of Oriental and African Studies',
    'Sheffield Hallam University',
    'Southampton Solent University',
    'St George\'s Hospital Medical School',
    'St Mary \'s University, Twickenham',
    'Staffordshire University',
    'Teesside University',
    'The Arts University College At Bournemouth',
    'The Manchester Metropolitan University',
    'The Nottingham Trent University',
    'The Open University',
    'The Royal College of Nursing',
    'The Royal Veterinary College',
    'Trinity Laban',
    'University of the West of England, Bristol',
    'University of Warwick',
    'University of West London',
    'University of Westminster',
    'Writtle University College',
    'University of Winchester',
    'University of Wolverhampton',
    'University of Worcester',
    'University of York',
    'York St John University'
  ];

  String selectedUniversity;
  final _postcodeController = TextEditingController();

  @override
  void initState() {
    if (widget.student.postcode != null) {
      _postcodeController.text = widget.student.postcode;
      _postcodeController.selection = TextSelection.fromPosition(
          TextPosition(offset: _postcodeController.text.length));
    }
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
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
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
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      width: 329.4,
                      height: 60,
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
                  ),
                  Spacer(flex: 3),
                  BottomProgressRow(
                    fractionProgress: 0.5,
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
                        {"pageNumber": 1},
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: NextPageButton(
                    onPress: () async {
                      String postcode = _postcodeController.text;

                      Future<bool> isValidPostcode =
                          apiService.isValidPostcode(postcode);
                      bool isValid = await isValidPostcode;
                      if (isValid == true && selectedUniversity != null) {
                        apiService.updateStudent(
                          widget.student.id,
                          {
                            "postcode": postcode,
                            "pageNumber": 3,
                            "university": selectedUniversity
                          },
                        );
                      } else {
                        // TODO: implement error because postcode is not valid
                        print('NO ITS NOT VALID ');
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
}
