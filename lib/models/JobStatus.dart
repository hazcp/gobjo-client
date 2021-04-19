class JobStatus {
  String jobId;
  String studentId;
  String appliedTime;
  String jobStatus;

  JobStatus();

  factory JobStatus.fromJson({Map<dynamic, dynamic> data}) {
    JobStatus jobStatus = JobStatus();
    jobStatus.jobId = data['jobId'];
    jobStatus.studentId = data['studentId'];
    jobStatus.appliedTime = data['appliedTime'];
    jobStatus.jobStatus = data['jobStatus'];
    return jobStatus;
  }
}
