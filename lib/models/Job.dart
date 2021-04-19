class Job {
  String id;
  String title;
  String employer;
  double wage;
  String timeFrom;
  String timeTo;
  String location;
  String postcode;
  double longitude;
  double latitude;
  String description;
  double distanceToPostcode;

  Job();

  factory Job.fromJson({Map<dynamic, dynamic> data}) {
    Job job = Job();
    job.id = data['_id'];
    job.title = data['title'];
    job.employer = data['employer'];
    job.wage = data['wage'].toDouble();
    job.timeFrom = data['timeFrom'];
    job.timeTo = data['timeTo'];
    job.location = data['location'];
    job.postcode = data['postcode'];
    job.longitude = data['longitude'].toDouble();
    job.latitude = data['latitude'].toDouble();
    job.description = data['description'];

    return job;
  }
}
