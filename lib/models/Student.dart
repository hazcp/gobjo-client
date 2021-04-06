class Student {
  String id;
  String email;
  String password;
  String name;
  int pageNumber;
  int age;
  String postcode;
  String university;

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
    return student;
  }
}
