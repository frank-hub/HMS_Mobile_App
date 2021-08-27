import 'package:flutter/material.dart';
import 'package:hms/screens/doctor/homescreen.dart';
import 'package:hms/screens/patient/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  var user;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }
  void _checkIfLoggedIn() async{
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user_details = localStorage.getString('user');
    if(user_details!= null){
    setState(() {
      user = user_details.toString();
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    if(user['user_role'].toString() == 'doctor'){
      print(user['user_role'].toString());
      return HomeScreen();
    }else{
      return HomeScreenDoctor();
    }
  }
}
