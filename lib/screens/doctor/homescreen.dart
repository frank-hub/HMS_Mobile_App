import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/api/api.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/screens/doctor/UpdateDetails.dart';
import 'package:hms/screens/patient/profile.dart';
import 'package:hms/shared/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreenDoctor extends StatefulWidget {
  @override
  _HomeScreenDoctorState createState() => _HomeScreenDoctorState();
}

class _HomeScreenDoctorState extends State<HomeScreenDoctor> {
  var userData;
  String totalPatient = "";
  String appointment = "";
  @override
  void initState() {
    _getUserInfo();
    getBookingDetails();
    super.initState();
  }
  
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return ' Morning';
    }
    if (hour < 17) {
      return ' Afternoon';
    }
    return ' Evening';
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;

    });

  }
  List<Booking> _bookings = [];
  Future<Null> getBookingDetails() async {
    final response = await CallApi().getData('/booking/my_bookings/');
    final responseJson = json.decode(response.body);

    final count_response = await CallApi().getData('/count/activities/');
    final countJson = json.decode(count_response.body);
    setState(() {
      for (Map<String, dynamic> booking in responseJson['bookings']){
        _bookings.add(Booking.fromJson(booking));
      }

      totalPatient = countJson['patient'].toString();
      appointment = countJson['bookings'].toString();
    });

  }

  
  set __isLoggedIn(bool __isLoggedIn) {}

  logout()  async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      __isLoggedIn=false;
    });
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return Loading();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  UpdateDetails())
                  );
                },
                child: Icon(
                  Icons.doorbell_outlined,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Profile()));
                },
                child: Icon(
                  Icons.person,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async{
                  await logout();
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good " +greeting()+", "+"Dr. "+userData['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Have a nice "+greeting()+" at work",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w300
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset("assets/images/stethoscope.png",
                        fit:BoxFit.fill,
                        height: 70,
                        width: 70,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Reports",style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment:
                        Alignment.center, // This is needed
                        child: FaIcon(FontAwesomeIcons.hospitalUser,
                          size: 50,
                          color: Colors.lightBlue,
                        ),
                      ),
                      Text(
                        "Total Patients",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        totalPatient,
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
                        padding: EdgeInsets.all(8),
                        alignment:
                        Alignment.center, // This is needed
                        child: FaIcon(FontAwesomeIcons.calendarWeek,
                          size: 50,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        "Appointments",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        appointment,
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
                        padding: EdgeInsets.all(8),
                        alignment:
                        Alignment.center, // This is needed
                        child: FaIcon(FontAwesomeIcons.capsules,
                          size: 50,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        "Closed Bookings",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "58",
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
            SizedBox(height: 15,),
            Text("My Appointments",style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
            Container(
              padding: EdgeInsets.all(10),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name"),
                  Text("Location"),
                  Text("Date"),
                  Text("Time"),
                  Text("Status"),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _bookings.length,
                itemBuilder: (context , index){
                  return new GestureDetector(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_bookings[index].name),
                            Text(_bookings[index].location.toString()),
                            Text(_bookings[index].date),
                            Text(_bookings[index].time),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Booking {

  final int id;
  final String name, date,time;
  final String ? location;
  Booking({required this.id, required this.name, required this.date, this.location = 'Kuwait' ,required this.time});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return new Booking(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      location: json['location'],
      time: json['time'],
    );
  }

}