class DoctorList {
  final int id;
  final String name;
  final String email;
  final String ? location;
  final String gender;
  final String category;
  final String age;

  DoctorList({required this.id,required this.name,required this.email,required this.location ,required this.gender,required this.category, required this.age});

  factory DoctorList.fromJson(Map<String , dynamic> json){

    return DoctorList(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      location: json['location'],
      gender: json['gender'],
      category: json['category'],
      age: json['dob'],
    );
  }
}