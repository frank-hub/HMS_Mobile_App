import 'dart:convert';

class User{
  final String name;
 final String email;
  final int phone;

  User({ required this.name, required this.email, required this.phone});

  User.fromJson(Map<String, dynamic>json):
  name=json['name'],
  email=json['email'],
  phone=json['phone'] as int;

}