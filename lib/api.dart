import 'dart:async';
import 'dart:convert';

import 'models/Job.dart';
import 'package:http/http.dart' as http;

import 'models/JobStatus.dart';
import 'models/Student.dart';

class APIService {
  final ngrokUrl = "https://f8f327712d57.ngrok.io";

  final StreamController<Student> studentStream =
      StreamController<Student>.broadcast();

  dispose() {
    studentStream.close();
  }

  Future<Student> createStudent(String email, String password) async {
    try {
      var url = Uri.parse('$ngrokUrl/student');
      http.Response response = await http.post(
        url,
        body: {"email": email, "password": password},
      );
      final studentJSON = jsonDecode(response.body);
      final student = Student.fromJson(data: studentJSON);
      studentStream.add(student);
      return student;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // make return something? perhaps ID of job status or status code
  void createJobStatus(String jobId, String studentId, String jobStatus) async {
    try {
      var url = Uri.parse('$ngrokUrl/job-status');
      DateTime now = DateTime.now();
      String appliedTime = now.toIso8601String();
      await http.post(
        url,
        body: {
          "jobId": jobId,
          "studentId": studentId,
          "appliedTime": appliedTime,
          "jobStatus": jobStatus
        },
      );
    } catch (e) {
      print(e);
    }
  }

  // make return something? perhaps ID of job status or status code
  Future<List<JobStatus>> findAllAppliedJobs(String studentId) async {
    var url = Uri.encodeFull('$ngrokUrl/job-status/find?studentId=$studentId');

    http.Response response = await http.get(url);
    List<JobStatus> jobStatuses = [];
    final searchResultsJSON = jsonDecode(response.body);
    searchResultsJSON.forEach((jobStatus) {
      jobStatuses.add(JobStatus.fromJson(data: jobStatus));
      print(jobStatus);
    });
    return jobStatuses;
  }

  Future<Student> updateStudent(
      String id, Map<dynamic, dynamic> jsonObject) async {
    try {
      var url = Uri.encodeFull('$ngrokUrl/student/$id');
      http.Response response = await http.patch(url,
          body: JsonEncoder().convert(jsonObject),
          headers: {"Content-Type": "application/json"});
      final studentJSON = jsonDecode(response.body);
      final student = Student.fromJson(data: studentJSON);
      studentStream.add(student);
      return student;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Future<List<Job>> searchJobs(String upperLat, String lowerLat,
  //     String upperLong, String lowerLong) async {
  //   var url = Uri.encodeFull(
  //       '$ngrokUrl/job/search?upperLat=$upperLat&lowerLat=$lowerLat&upperLong=$upperLong&lowerLong=$lowerLong');
  //   http.Response response = await http.get(url);
  //
  //   List<Job> jobs = [];
  //   final searchResultsJSON = jsonDecode(response.body);
  //   searchResultsJSON.forEach((job) {
  //     jobs.add(Job.fromJson(data: job));
  //     print(job);
  //   });
  //   return jobs;
  // }

  Future<Job> findJob(String jobId) async {
    var url = Uri.encodeFull('$ngrokUrl/job/find/$jobId');
    http.Response response = await http.get(url);
    final jobJSON = jsonDecode(response.body);
    final theJob = Job.fromJson(data: jobJSON);
    return theJob;
  }

  Future<List<Job>> searchJobs(
    String postcode,
    String specifiedDistanceKm,
    bool isToday,
  ) async {
    double specifiedDistanceM =
        1000 * double.parse(specifiedDistanceKm); // km -> m
    String specifiedDistanceMString = specifiedDistanceM.toString();
    var url = Uri.encodeFull(
        '$ngrokUrl/job/search?postcode=$postcode&specifiedDistance=$specifiedDistanceMString&isToday=$isToday');

    http.Response response = await http.get(url);
    List<Job> jobs = [];
    final searchResultsJSON = jsonDecode(response.body);
    searchResultsJSON.forEach((job) {
      jobs.add(Job.fromJson(data: job));
      print(job);
    });
    return jobs;
  }

  Future<bool> isValidPostcode(String postcode) async {
    bool isValid;
    var url =
        Uri.encodeFull('https://api.postcodes.io/postcodes/$postcode/validate');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body);
      isValid = parsedJson["result"];
      return isValid;
    } else {
      isValid = false;
      return isValid;
    }
  }

  Future<List<double>> postCodeToLatLong(String postcode) async {
    List<double> latLongList = [];
    var url = Uri.encodeFull('https://api.postcodes.io/postcodes/$postcode');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> parsedJson = jsonDecode(response.body);
      var latitude = parsedJson["result"]["latitude"];
      var longitude = parsedJson["result"]["longitude"];
      // longLatList -> [latitudePostcode, longitudePostcode]
      latLongList.add(latitude);
      latLongList.add(longitude);
      return latLongList;
    } else {
      print('Couldnt convert to long lat');
    }
    return null;
  }
}

APIService apiService = APIService();
