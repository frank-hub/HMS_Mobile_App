class DoctorList {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String category;
  final String age;

  DoctorList({required this.id,required this.name,required this.email,required this.gender,required this.category, required this.age});

  factory DoctorList.fromJson(Map<String , dynamic> json){
    // id": 13,
    // "doc_id": 5,
    // "category": "Orthopedic",
    // "gender": "Male",
    // "age":
    return DoctorList(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      category: json['category'],
      age: json['age'],
    );
  }
}