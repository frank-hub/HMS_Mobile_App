import 'dart:convert';

class User{
  final String name;
 final String email;
  final int phone;

  User({ required this.name, required this.email, required this.phone});

  factory User.fromJson(Map<String, dynamic>json){
  return User (
      name:json['name'],
      email:json['email'],
      phone:json['phone'] as int
    );
  }

}
class UserData {

  String name;
  String email;
  int phone;
  UserData(
      {
        required this.name,
        required this.email,
        required this.phone,

      });
}