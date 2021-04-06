class Employer {
  String email;
  String password;
  String nameBusiness;
  String typeBusiness;
  String location;
  String postcode;

  Employer();

  factory Employer.fromJson({Map<dynamic, dynamic> data}) {
    Employer employer = Employer();
    employer.email = data['email'];
    employer.password = data['password'];
    employer.nameBusiness = data['nameBusiness'];
    employer.typeBusiness = data['typeBusiness'];
    employer.location = data['location'];
    employer.postcode = data['postcode'];
    return employer;
  }
}
