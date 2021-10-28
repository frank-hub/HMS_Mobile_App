import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/payment/paymentmethod.dart';
import 'package:hms/screens/doctor/homescreen.dart';
import 'package:hms/screens/labaratory/labhome.dart';
import 'package:hms/screens/patient/HomeScreen.dart';
import 'package:hms/screens/patient/revHomePage.dart';
import 'package:hms/screens/pharmacy/HomeScreenPharmacy.dart';
import 'package:hms/screens/splashscreen.dart';
import 'package:is_first_run/is_first_run.dart';

import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  String user_role="";
  bool? _isFirstRun;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _checkIfLoggedIn();
    _checkFirstRun();
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
    if(user_role=="Doctor"){
      return HomeScreenDoctor();
    }else if(user_role=="Laboratory"){
      return LabHome();
    }else if(user_role=="Pharmacy"){
      return HomeScreenPharmacy();
    }
    else{
      return PatientHome();
    }
  }
  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      _isFirstRun = ifr;
    });
  }
  splashscreen() {

    if(_isFirstRun !=null){
      return SplashScreen();
    }else{
      return Login();
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _isLoggedIn ? checkUserType(): Login(),
      ),
    );
  }
}