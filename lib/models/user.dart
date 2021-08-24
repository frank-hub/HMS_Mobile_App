import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

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
class CurrentUser{
  _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    return User.fromJson(user);

  }
}

