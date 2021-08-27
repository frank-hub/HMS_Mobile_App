import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/authenticate/usertype.dart';
import 'package:hms/screens/doctor/homescreen.dart';
import 'package:hms/screens/patient/HomeScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  String user_role="";
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }
  void _checkIfLoggedIn() async{
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    if(token!= null){
      setState(() {
        _isLoggedIn = true;
        user_role=user['user_role'];
      });
    }
  }
   checkUserType(){
    if(user_role=="doctor"){
      return HomeScreenDoctor();
    }
    else{
      return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _isLoggedIn ? checkUserType():  Login(),
      ),

    );
  }
}