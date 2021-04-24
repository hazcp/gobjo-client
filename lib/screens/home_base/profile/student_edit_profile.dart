import 'package:flutter/material.dart';
import 'package:test_app/components/textfields/signup_age_textfield.dart';
import 'package:test_app/components/textfields/signup_name_textfield.dart';
import 'package:test_app/components/textfields/signup_postcode_textfield.dart';
import 'package:test_app/models/Student.dart';
import '../../../constants.dart';

class StudentEditProfile extends StatefulWidget {
  StudentEditProfile({this.student});
  final Student student;
  @override
  _StudentEditProfileState createState() => _StudentEditProfileState();
}

class _StudentEditProfileState extends State<StudentEditProfile> {
  Student student;
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _postcodeController = TextEditingController();
  bool isValid;

  @override
  void initState() {
    student = widget.student;
    _nameController.text = student.name;
    _ageController.text = student.age.toString();
    _postcodeController.text = student.postcode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Edit Name:', style: kSecondaryGreyBItalic),
        SignUpNameTextField(
          textController: _nameController,
          validatorFunction: (value) {
            if (value == null || value.isEmpty) {
              return "Enter your name";
            }
            return null;
          },
        ),
        SizedBox(height: 15),
        Text('Edit Age:', style: kSecondaryGreyBItalic),
        SignUpAgeTextField(
          keyboardType: TextInputType.number,
          textController: _ageController,
          validatorFunction: (value) {
            if (value == null || value.isEmpty) {
              return "Enter your age";
            }
            return null;
          },
        ),
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            Text('Edit Postcode', style: kSecondaryGreyBItalic),
            Text(' (not visible to employers):', style: kSecondaryGreyItalic),
          ],
        ),
        SignUpPostcodeTextField(
          textController: _postcodeController,
          validatorFunction: (value) {
            if (value == null || value.isEmpty) {
              return "Enter your postcode";
            } else if (isValid == false) {
              return "Enter a valid postcode";
            }
            return null;
          },
        ),
        // SizedBox(height: 15),
        // Text('Previous Experience: ', style: kSecondaryGreyBItalic),
        // SizedBox(height: 15),
        // Text('Edit Profile Picture: ', style: kSecondaryGreyBItalic),
      ],
    );
  }
}
