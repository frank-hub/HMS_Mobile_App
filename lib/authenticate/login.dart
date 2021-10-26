import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/api/api.dart';
import 'package:hms/authenticate/register.dart';
import 'package:hms/authenticate/usertype.dart';
import 'package:hms/screens/doctor/homescreen.dart';
import 'package:hms/screens/labaratory/labhome.dart';
import 'package:hms/screens/patient/revHomePage.dart';
import 'package:hms/screens/pharmacy/HomeScreenPharmacy.dart';
import 'package:hms/screens/static/about.dart';
import 'package:hms/screens/static/help.dart';
import 'package:hms/screens/static/policies.dart';
import 'package:hms/screens/static/usermanual.dart';
import 'package:hms/services/auth.dart';
import 'package:hms/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  TextEditingController passwordController = new TextEditingController();
  TextEditingController userNameController= new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final key = new GlobalKey<ScaffoldState>();
  bool loading =false;
  String _errorMessage = '';
   var data;
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text('HMS'),
        backgroundColor: Color(0xFF6C63FF),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('About Us')),
              PopupMenuItem<int>(value: 1, child: Text('Policies')),
              PopupMenuItem<int>(value: 2, child: Text('User Manual')),
              PopupMenuItem<int>(value: 3, child: Text('Help')),
            ],
          ),
        ],
      ),
      key: key,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Color(0xFF6C63FF),
              Color(0xFF5A54C4),
              Color(0xFF5B55BE),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Center(
                  child:   Image.asset('assets/images/logo.png',
                    width: 150,
                  ),
                ),
               Center(
                 child:    Text(
                   "Welcome Back",
                   style: TextStyle(color: Colors.white, fontSize: 18,),
                 ),
               )
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        21, 105, 202, 0.30196078431372547),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Text(_errorMessage,style: TextStyle(color: Colors.red),),
                              Form(
                                key: _formKey,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]!))),
                                  child: TextFormField(
                                    controller: userNameController,
                                    validator: (value) => value!.isEmpty ? 'Please enter an email address' : null,
                                    decoration: InputDecoration(
                                        hintText: "Email or Phone number",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),

                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]!))),
                                child: TextFormField(
                                  controller: passwordController,
                                  validator: (value) => value!.isEmpty ? 'Please enter a password' : null,
                                  decoration: InputDecoration(
                                      hintText: "Password",

                                      hintStyle: TextStyle(color: Colors.blue),
                                      border: InputBorder.none),
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 300, height: 40),
                              child: ElevatedButton(
                                style: ButtonStyle(

                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0)

                                        )

                                    )
                                ),
                                onPressed: () {

                                  if (_formKey.currentState!.validate()) {
                                     _login();
                                  }                                  // Navigator.push(context,
                                  //     MaterialPageRoute(
                                  //         builder: (
                                  //             context) => HomeScreen()
                                  //     ));
                                },
                                child: Text('SIGN IN'),
                              )
                          ),),

                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child:ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor:MaterialStateProperty.all<Color>(Color(
                                  0xFFD2D0EF)),
                            ),
                            child: Text( "Sign Up",style: TextStyle(color: Colors.white),),
                            onPressed:  () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (
                                          context) => Register()
                                  ));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 210.0),
                          child: GestureDetector(
                            child: Text("Need Help (Helpline)",
                              style: TextStyle(
                                color:Colors.brown,
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                              ),
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void handleClick(int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => AboutUs()));
        break;
      case 1:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => Policies()));
        break;
      case 2:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => UserManual()));
        break;
      case 3:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => Help()));
        break;
    }
  }

  void _login() async{
    setState(() {
      loading = true;
    });
    
    if(EmailValidator.validate(userNameController.text)) {
      var data1 = {
        'email': userNameController.text,
        'password': passwordController.text
      };
      setState(() {
        data=data1;
      });
    }else{
      var data2 = {
        'phone': userNameController.text,
        'password': passwordController.text
      };
      setState(() {
        data=data2;
      });
    }
    var res = await CallApi().postData(data, '/auth/login');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['data']['token']);
      localStorage.setString('user', json.encode(body['data']['user']));
      String user_role=body['data']['user']['user_role'];
      Fluttertoast.showToast(msg: "User: "+user_role);
      if(user_role == "Doctor"){
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => HomeScreenDoctor()));

      }
      else if(user_role == "Pharmacy"){
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => HomeScreenPharmacy()));

      }else if(user_role == "Laboratory"){
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => LabHome()));

      }
      else{
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => PatientHome()));
      }
    }else{
      _errorMessage="Invalid Credentials";
    }
    setState(() {
      loading = false;
    });


  }
}