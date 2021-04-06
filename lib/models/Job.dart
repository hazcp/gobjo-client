import 'package:intl/intl.dart';

class Job {
  double distance;
  String userId;
  String when;

  String title;
  String employer;
  double wage;
  String timeFrom;
  String timeTo;
  String location;
  String postcode;
  String description;

  Job();

  factory Job.fromJson({Map<dynamic, dynamic> data}) {
    Job job = Job();
    job.distance = data['distance'];
    job.userId = data['userId'];
    job.when = data['when'];
    job.title = data['title'];
    job.employer = data['employer'];
    job.wage = data['wage'].toDouble();
    job.timeFrom = DateFormat.Hm().format(DateTime.parse(data[
        'timeFrom'])); // parses ISO8601 format into datetime format, and uses intl to change into readable time
    job.timeTo = DateFormat.Hm().format(DateTime.parse(data['timeTo']));
    job.location = data['location'];
    job.postcode = data['postcode'];
    job.description = data['description'];

    return job;
  }
}
