import 'package:flutter/material.dart';
import '../../../constants.dart';

class StudentEditProfile extends StatefulWidget {
  @override
  _StudentEditProfileState createState() => _StudentEditProfileState();
}

class _StudentEditProfileState extends State<StudentEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Edit Name:', style: kSecondaryGreyBItalic),
        TextField(
          decoration: InputDecoration(
            labelText: 'Harrison Porter',
          ),
        ),
        SizedBox(height: 15),
        Text('Edit Age:', style: kSecondaryGreyBItalic),
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            Text('Edit Postcode', style: kSecondaryGreyBItalic),
            Text(' (not visible to employers):', style: kSecondaryGreyItalic),
          ],
        ),
        SizedBox(height: 15),
        Text('Previous Experience: ', style: kSecondaryGreyBItalic),
        SizedBox(height: 15),
        Text('Edit Profile Picture: ', style: kSecondaryGreyBItalic),
      ],
    );
  }
}
