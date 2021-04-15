class Student {
  String id;
  String email;
  String password;
  String name;
  int pageNumber;
  int age;
  String postcode;
  String university;
  bool isBarStaff;
  bool isKitchenPorter;
  bool isWaiter;
  String prevSearchTimeRange;
  String prevSearchFarAwayRange;

  Student();

  factory Student.fromJson({Map<dynamic, dynamic> data}) {
    Student student = Student();
    student.id = data['_id'];
    student.email = data['email'];
    student.pageNumber = data['pageNumber'];
    student.password = data['password'];
    student.name = data['name'];
    student.age = data['age'];
    student.postcode = data['postcode'];
    student.university = data['university'];
    student.isBarStaff = data['isBarStaff'];
    student.isKitchenPorter = data['isKitchenPorter'];
    student.isWaiter = data['isWaiter'];
    student.prevSearchTimeRange = data['prevSearchTimeRange'];
    student.prevSearchFarAwayRange = data['prevSearchFarAwayRange'];
    return student;
  }
}
