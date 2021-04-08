import 'package:flutter/material.dart';
import 'package:test_app/models/Student.dart';

import '../../../api.dart';
import 'package:geodesy/geodesy.dart';
import '../../../constants.dart';

import '../../../components/standard_outlined_button.dart';
import '../../../components/standard_button.dart';

class StudentHome extends StatefulWidget {
  StudentHome({this.student});
  final Student student;

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  bool isSelectedToday = false;
  bool isSelectedONW = false;
  double willingToTravel = 2.5;
  String willingToTravelString = 'Up to 2.5 km away';
  Geodesy geodesy = Geodesy();
  List<double>
      latLongRange; // [latUpperOfRange, longUpperOfRange, latLowerOfRange, longLowerOfRange]

  List<double> generateLatLongRange(
      {double specifiedDistanceKm, List<double> latLongOfPostcode}) {
    List<double> latLongRange = [];
    double specifiedDistanceToMetres = specifiedDistanceKm * 1000;
    double postcodeLatitude = latLongOfPostcode[0];
    double postcodeLongitude = latLongOfPostcode[1];

    LatLng postcodeLatLong = LatLng(postcodeLatitude, postcodeLongitude);
    for (int i = 0; i < 5; i++) {
      LatLng destinationPoint = geodesy.destinationPointByDistanceAndBearing(
          postcodeLatLong, specifiedDistanceToMetres, i * 90.0);
      if (i % 2 == 0) {
        // if bearing is north or south (aka longitude is constant)
        double lat = destinationPoint.latitude;
        latLongRange.add(lat);
      } else {
        // if bearing is east or west (aka latitude is constant)
        double long = destinationPoint.longitude;
        latLongRange.add(long);
      }
    }
    return latLongRange;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'When do you want to work?',
            style: kStudentHomeTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 40.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: StandardOutlinedButton(
                  textButton: 'TODAY',
                  buttonTextColour:
                      isSelectedToday ? Colors.white : kPurpleThemeColour,
                  buttonColour:
                      isSelectedToday ? kPurpleThemeColour : Colors.white,
                  onPressed: () {
                    setState(() {
                      if (isSelectedToday) {
                        isSelectedToday = false;
                      } else {
                        isSelectedToday = true;
                        isSelectedONW = false;
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: StandardOutlinedButton(
                  textButton: 'OVER NEXT WEEK',
                  buttonTextColour:
                      isSelectedONW ? Colors.white : kPurpleThemeColour,
                  buttonColour:
                      isSelectedONW ? kPurpleThemeColour : Colors.white,
                  onPressed: () {
                    setState(
                      () {
                        if (isSelectedONW) {
                          isSelectedONW = false;
                        } else {
                          isSelectedONW = true;
                          isSelectedToday = false;
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'How far are you willing to travel?',
            style: kStudentHomeTextStyle,
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: kPurpleThemeColour,
            inactiveTrackColor: kPurpleThemeColourTransparent,
            thumbColor: Color(0xFF018786),
            overlayColor: kPurpleThemeColourTransparent,
          ),
          child: Slider(
            value: willingToTravel.toDouble(),
            min: 0.5,
            max: 5.0,
            divisions: 9,
            onChanged: (double newValue) {
              setState(() {
                willingToTravel = newValue;
                if (willingToTravel == 5) {
                  willingToTravelString = 'Greater than 5.0 km away';
                } else if (willingToTravel == 0.5) {
                  willingToTravelString = 'Less than $willingToTravel km away';
                } else {
                  willingToTravelString = 'Up to $willingToTravel km away';
                }
              });
            },
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          willingToTravelString,
          style: kWillingToTravelStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: StandardButton(
            textButton: 'FIND JOBS FOR ME',
            onPressed: () async {
              // get lat long of student's postcode in a list with format: [lat, long]
              final latLongList =
                  await apiService.postCodeToLatLong(widget.student.postcode);

              latLongRange = generateLatLongRange(
                latLongOfPostcode: latLongList,
                specifiedDistanceKm: willingToTravel,
              );
              String upperLat = latLongRange[0].toString();
              String upperLong = latLongRange[1].toString();
              String lowerLat = latLongRange[2].toString();
              String lowerLong = latLongRange[3].toString();

              print('Upper Lat Range: ' + upperLat.toString());
              print('Lower Lat Range: ' + lowerLat.toString());
              print('Upper Long Range: ' + upperLong.toString());
              print('Lower Long Range: ' + lowerLong.toString());

              // final jobs = await apiService.searchJobs(
              //     upperLat, lowerLat, upperLong, lowerLong);
              final jobs = await apiService.searchJobs("Location1");
              for (var job in jobs) {
                print(job.employer.toString());
              }

/*              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentSearchList(jobs),
                ),
              );*/

              /*
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      StudentHubSearch(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );*/
            },
            colourButton: kPurpleThemeColour,
          ),
        ),
      ],
    );
  }
}
