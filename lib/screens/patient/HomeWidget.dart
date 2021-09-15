import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/api/api.dart';
import 'package:hms/models/DoctorList.dart';
import 'package:hms/models/MyAppointments.dart';
import 'package:hms/models/user.dart';
import 'package:hms/screens/doctor/doctorslist.dart';
import 'package:hms/screens/doctor/test.dart';
import 'package:hms/services/auth.dart';
import 'package:hms/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
  PageController pageController = PageController(initialPage: 0);

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;

    });
  }
  Future<List<MyAppointments>> _fetchAppointments() async {
    var data = {
    'uid' : userData['id'].toString(),
    };
    var response = await CallApi().fetchData(data,'/booking/my_bookings');
    // final response = await http.get('http://localhost:8000/api/categories');
    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);

      List<dynamic> ? jsonResponse = map["bookings"];
      print(jsonResponse);
      return jsonResponse!.map((job) => new MyAppointments.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load Events from API');
    }
  }
  ListView _appointmentsListView(data) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              child: Container(
                padding: EdgeInsets.all(8),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/images/doctor.png",
                            height: 70,
                            width: 70,
                          ),
                        ),
                        Stack(
                          alignment: Alignment.topLeft,
                          overflow: Overflow.visible,
                          children: [
                            Text(
                             "Doctor: " +data[index].doctor_name,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),


                          ],

                        ),


                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Positioned(
                      top: 20,
                      // bottom: 1,
                      child: Text(
                        "Description: " +data[index].description,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        FaIcon(FontAwesomeIcons.clock),
                        SizedBox(
                          width: 10,
                        ),
                        Text(data[index].date +", @"+data[index].time)
                      ],
                    ),
                  ],
                ),
              ));

        });

  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return Loading();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    overflow: Overflow.visible,
                    children: [
                      Text(
                        greeting()+", " ,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        // bottom: 1,
                        child: Text(userData['name'],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 3,
                          ),
                        ),
                      )
                    ],
                  ),
                  CircleAvatar(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: new InputDecoration(
                  prefixIcon: new Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.blue,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Container(
                            alignment:
                            Alignment.center, // This is needed
                            child: Image.asset(
                              "assets/images/fever.png",
                              fit: BoxFit.contain,
                              width: 125,
                              height: 90,
                            ),
                          ),
                          Text(
                            "General",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      color: Colors.grey[200],
                    ),
                    Card(
                      child: Column(
                        children: [
                          Container(
                            alignment:
                            Alignment.center, // This is needed
                            child: Image.asset(
                              "assets/images/pediatrician.png",
                              fit: BoxFit.contain,
                              width: 125,
                              height: 90,
                            ),
                          ),
                          Text(
                            "Pediatrician",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      color: Colors.grey[200],
                    ),
                    Card(
                      child: Column(
                        children: [
                          Container(
                            alignment:
                            Alignment.center, // This is needed
                            child: Image.asset(
                              "assets/images/baby.png",
                              fit: BoxFit.contain,
                              width: 125,
                              height: 90,
                            ),
                          ),
                          Text(
                            "Pregnancy",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      color: Colors.grey[200],
                    ),
                    Card(
                      child: Column(
                        children: [
                          Container(
                            alignment:
                            Alignment.center, // This is needed
                            child: Image.asset(
                              "assets/images/broken-arm.png",
                              fit: BoxFit.contain,
                              width: 125,
                              height: 90,
                            ),
                          ),
                          Text(
                            "Pregnancy",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      color: Colors.grey[200],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'My Appointment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Flexible(
                child: FutureBuilder<List<MyAppointments>>(
                  future: _fetchAppointments(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MyAppointments>? data = snapshot.data;
                      return _appointmentsListView(data);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Available Doctors',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                        width: 100,
                      ),
                      Positioned(
                          left: 90,
                          top: 39,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. Abjul Othman",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "General Practitioner",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}
