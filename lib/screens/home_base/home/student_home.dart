import 'package:flutter/material.dart';
import 'package:test_app/models/Job.dart';
import 'package:test_app/models/Student.dart';
import 'package:test_app/screens/home_base/home/student_search_list.dart';

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
  bool isSelectedToday;
  bool isSelectedONW;
  double willingToTravel;
  String willingToTravelString;
  bool isSearching;
  bool firstTime;
  List<Job> jobs;
  List<Job> finalJobs;
  Geodesy geodesy = Geodesy();

  Student student;
  String prevSearchTimeRange;
  String prevSearchFarAwayRange;

  // List<double> generateLatLongRange(
  //     {double specifiedDistanceKm, List<double> latLongOfPostcode}) {
  //   List<double> latLongRange = [];
  //   double specifiedDistanceToMetres = specifiedDistanceKm * 1000;
  //   double postcodeLatitude = latLongOfPostcode[0];
  //   double postcodeLongitude = latLongOfPostcode[1];
  //
  //   LatLng postcodeLatLong = LatLng(postcodeLatitude, postcodeLongitude);
  //   for (int i = 0; i < 5; i++) {
  //     LatLng destinationPoint = geodesy.destinationPointByDistanceAndBearing(
  //         postcodeLatLong, specifiedDistanceToMetres, i * 90.0);
  //     if (i % 2 == 0) {
  //       // if bearing is north or south (aka longitude is constant)
  //       double lat = destinationPoint.latitude;
  //       latLongRange.add(lat);
  //     } else {
  //       // if bearing is east or west (aka latitude is constant)
  //       double long = destinationPoint.longitude;
  //       latLongRange.add(long);
  //     }
  //   }
  //   return latLongRange;
  // }

  Future<List<Job>> sortAndCalcDistanceJobs(
      List<Job> initialJobList, double specifiedDistance) async {
    List<Job> finalJobList = [];
    // get lat long of student's postcode in a list with format: [lat, long]
    final latLongPostcode =
        await apiService.postCodeToLatLong(widget.student.postcode);
    LatLng postcodeLatLng = LatLng(latLongPostcode[0], latLongPostcode[1]);

    for (int i = 0; i < initialJobList.length; i++) {
      Job currJob = initialJobList[i];
      LatLng currJobLatLng = LatLng(currJob.latitude, currJob.longitude);
      double distanceBetween = double.parse(
          (geodesy.distanceBetweenTwoGeoPoints(currJobLatLng, postcodeLatLng) /
                  1000)
              .toStringAsFixed(2));
      print(distanceBetween);

      currJob.distanceToPostcode = distanceBetween;
      finalJobList.add(currJob);
      // sort by distance closest to furthest?
      // if (distanceBetween < specifiedDistance && firstTime) {
      //   finalJobList.add(currJob);
      //   firstTime = false;
      // } else if (distanceBetween < specifiedDistance) {
      //   for(int i = 0; i < finalJobList.length; i++) {
      //
      //   }
      // }
    }
    return finalJobList;
  }

  @override
  void initState() {
    super.initState();
    student = widget.student;
    prevSearchTimeRange = student.prevSearchTimeRange;
    prevSearchFarAwayRange = student.prevSearchFarAwayRange;

    if (prevSearchTimeRange == null && prevSearchFarAwayRange == null) {
      willingToTravel = 2.5;
      willingToTravelString = 'Up to 2.5 km away';
      isSelectedToday = false;
      isSelectedONW = false;
    } else {
      if (prevSearchTimeRange == "Today") {
        isSelectedToday = true;
        isSelectedONW = false;
      } else {
        isSelectedONW = true;
        isSelectedToday = false;
      }
      willingToTravel = double.parse(prevSearchFarAwayRange);
      willingToTravelString = 'Up to $willingToTravel km away';
    }
    isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      !isSearching
          ? buildHome()
          : StudentSearchList(jobList: finalJobs, student: widget.student),
    ]);
  }

  Widget buildHome() {
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
              print(isSelectedToday);
              if (isSelectedToday) {
                prevSearchTimeRange = "Today";
              } else {
                prevSearchTimeRange = "ONW";
              }
              print(willingToTravel);
              prevSearchFarAwayRange = willingToTravel.toString();

              apiService.updateStudent(
                widget.student.id,
                {
                  "prevSearchTimeRange": prevSearchTimeRange,
                  "prevSearchFarAwayRange": prevSearchFarAwayRange
                },
              );

              jobs = await apiService.searchJobs(widget.student.postcode,
                  willingToTravel.toString(), isSelectedToday);

              finalJobs = await sortAndCalcDistanceJobs(jobs, willingToTravel);

              for (var job in finalJobs) {
                print(job.employer.toString());
                print(job.distanceToPostcode.toString());
              }

              setState(() {
                isSearching = true;
              });
            },
            colourButton: kPurpleThemeColour,
          ),
        ),
      ],
    );
  }
}
