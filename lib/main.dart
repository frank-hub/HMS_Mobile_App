import 'package:flutter/material.dart';
import 'package:hms/screens/patient/HomeScreen.dart';
import 'package:hms/services/auth.dart';
import 'package:hms/services/auth2.dart';
import 'package:hms/shared/loading.dart';
import 'package:hms/wrapper.dart';
import 'package:provider/provider.dart';

import 'authenticate/login.dart';
import 'authenticate/register.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Auth()),
        ],
          child: MyApp(),
        ),
  );

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Consumer<Auth>(
            builder:  (context, auth, child){
              switch (auth.isAuthenticated) {
                case true:
                  return HomeScreen();
                default:
                  return Login();
              }
            },
          ),
        ),
      ),
    );
  }
}

