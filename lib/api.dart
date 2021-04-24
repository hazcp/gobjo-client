import 'dart:async';
import 'dart:convert';

import 'models/Job.dart';
import 'package:http/http.dart' as http;

import 'models/JobStatus.dart';
import 'models/Student.dart';

class APIService {
  final ngrokUrl = "https://f0cc3b0224d6.ngrok.io";

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

  void loginStudent(String email, String password) async {
    var url = Uri.encodeFull(
        '$ngrokUrl/student/login?email=$email&password=$password');
    http.Response response = await http.post(url);
    final studentJSON = jsonDecode(response.body);
    final student = Student.fromJson(data: studentJSON);
    studentStream.add(student);
  }

  Future<bool> isExistingStudentEmail(String email) async {
    var url = Uri.encodeFull('$ngrokUrl/student/find?email=$email');
    http.Response response = await http.get(url);
    final parsedJSON = jsonDecode(response.body);
    final emailExists = parsedJSON['exists'];
    return emailExists;
  }

  Future<bool> isPasswordCorrect(String email, String password) async {
    var url = Uri.encodeFull(
        '$ngrokUrl/student/validate?email=$email&password=$password');
    http.Response response = await http.get(url);
    final parsedJSON = jsonDecode(response.body);
    final isPasswordCorrect = parsedJSON['correct'];
    return isPasswordCorrect;
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

  void updateJobStatus(String studentId, String jobId, String jobStatus) async {
    try {
      var url = Uri.encodeFull('$ngrokUrl/job-status');
      await http.patch(url,
          body: JsonEncoder().convert(
              {"studentId": studentId, "jobId": jobId, "jobStatus": jobStatus}),
          headers: {"Content-Type": "application/json"});
    } catch (e) {
      print(e);
    }
    return null;
  }

  // make return something? perhaps ID of job status or status code
  Future<List<JobStatus>> findAllJobsWithStatusX(
      String studentId, String jobStatus) async {
    var url = Uri.encodeFull(
        '$ngrokUrl/job-status/find?studentId=$studentId&jobStatus=$jobStatus');

    http.Response response = await http.get(url);
    List<JobStatus> jobStatuses = [];
    final searchResultsJSON = jsonDecode(response.body);
    searchResultsJSON.forEach((jobStatus) {
      jobStatuses.add(JobStatus.fromJson(data: jobStatus));
      print(jobStatus);
    });
    return jobStatuses;
  }

  // Future<bool> isJobSaved(String studentId, String jobId) async {
  //   bool isJobSaved;
  //   var url = Uri.encodeFull(
  //       '$ngrokUrl/job-status/issaved?studentId=$studentId&jobId=$jobId');
  //   http.Response response = await http.get(url);
  //   // String jsonDataString = response.toString();
  //   // final parsedJSON = jsonDecode(jsonDataString);
  //   // final isJobSaved = parsedJSON['saved'];
  //   // final parsedJSON = jsonDecode(response.body);
  //   // final isJobSaved = parsedJSON['saved'];
  //   if (response.body == "true") {
  //     isJobSaved = true;
  //   } else if (response.body == "false") {
  //     isJobSaved = false;
  //   }
  //   return isJobSaved;
  // }

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

  Future<Job> findJob(String jobId, String studentId) async {
    var url =
        Uri.encodeFull('$ngrokUrl/job/find?jobId=$jobId&studentId=$studentId');
    http.Response response = await http.get(url);
    final jobJSON = jsonDecode(response.body);
    final theJob = Job.fromJson(data: jobJSON);
    return theJob;
  }

  Future<List<Job>> searchJobs(String postcode, String specifiedDistanceKm,
      bool isToday, String studentId) async {
    double specifiedDistanceM =
        1000 * double.parse(specifiedDistanceKm); // km -> m
    String specifiedDistanceMString = specifiedDistanceM.toString();
    var url = Uri.encodeFull(
        '$ngrokUrl/job/search?postcode=$postcode&specifiedDistance=$specifiedDistanceMString&isToday=$isToday&studentId=$studentId');

    http.Response response = await http.get(url);
    List<Job> jobs = [];
    final searchResultsJSON = jsonDecode(response.body);
    searchResultsJSON.forEach((job) {
      jobs.add(Job.fromJson(data: job));
      // print(job);
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
