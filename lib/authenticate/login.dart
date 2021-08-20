import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/api/api.dart';
import 'package:hms/authenticate/register.dart';
import 'package:hms/screens/patient/HomeScreen.dart';
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
  TextEditingController emailController= new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final key = new GlobalKey<ScaffoldState>();
  bool loading =false;
  String _errorMessage = '';

  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
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
                                    controller: emailController,
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
                                  Map creds={
                                    'email' :emailController.text,
                                    'password':passwordController.text

                                  };
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
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue),
                                child: Center(
                                  child: SignInButton(
                                    Buttons.Facebook,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey),
                                child: Center(
                                  child: SignInButton(
                                    Buttons.Google,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            )
                          ],
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
  void _login() async{

    setState(() {
      loading = true;
    });

    var data = {
      'email' : emailController.text,
      'password' : passwordController.text
    };

    var res = await CallApi().postData(data, '/auth/login');
    var body = json.decode(res.body);
print(body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['data']['token']);
      print(body['data']['token']);
      localStorage.setString('user', json.encode(body['data']['user']));

      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => HomeScreen()));

    }else{
      _errorMessage="Invalid Credentials";
    }
    setState(() {
      loading = false;
    });


  }
}


