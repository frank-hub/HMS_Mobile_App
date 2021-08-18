import 'dart:convert';

class User{
  late String name;
 late String email;
  late String avatar;

  User( this.name,this.email, this.avatar);

  User.fromJson(Map<String, dynamic>json):
  name=json['name'],
  email=json['email'],
  avatar=json['avatar'];

}