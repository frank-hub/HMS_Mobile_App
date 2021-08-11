import 'package:flutter/material.dart';
import 'package:hms/wrapper.dart';

import 'authenticate/login.dart';
import 'authenticate/register.dart';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Wrapper(),
      ),
    );
  }
}

