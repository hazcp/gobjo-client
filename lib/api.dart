import 'dart:async';
import 'dart:convert';

import 'models/Job.dart';
import 'package:http/http.dart' as http;

import 'models/Student.dart';

class APIService {
  final ngrokUrl = "https://7483f2324d00.ngrok.io";

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

  Future<List<Job>> searchJobs() async {
    http.Response response = await http
        .get('$ngrokUrl/job/search?distance=5.3&when=today&userId=123');
    final searchResultJSON = jsonDecode(response.body);
    List<Job> jobs = [];
    searchResultJSON.forEach((job) {
      jobs.add(Job.fromJson(data: job));
    });
    print(jobs);
    return jobs;
  }
}

APIService apiService = APIService();
