import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/api/api.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/screens/doctor/BookingDetails.dart';
import 'package:hms/screens/patient/profile.dart';
import 'package:hms/screens/pharmacy/orderdetails.dart';
import 'package:hms/shared/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenPharmacy extends StatefulWidget {
  @override
  _HomeScreenPharmacyState createState() => _HomeScreenPharmacyState();
}

class _HomeScreenPharmacyState extends State<HomeScreenPharmacy> {
  var userData;
  String totalPatient = "";
  String orders = "";
  String approvedBooking = "";
  var doc_id;
  @override
  void initState() {
    getUserInfo();
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

  getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
    print(userData['id'].toString());
    return getBookingDetails(userData['id'].toString());
  }

  List<Booking> _orders = [];
  void getBookingDetails(id) async {
    final response = await CallApi().getData('/pharmacyorder/my_orders/' + id);
    print(response.body.toString());
    final responseJson = json.decode(response.body);

    final count_response = await CallApi().getData('/count/pharmacy_activities/');
    final countJson = json.decode(count_response.body);
    setState(() {
      for (Map<String, dynamic> order in responseJson['orders']) {
        _orders.add(Booking.fromJson(order));
      }
      totalPatient = countJson['patient'].toString();
      orders = countJson['orders'].toString();
      approvedBooking = countJson['approved'].toString();
    });
  }

  set __isLoggedIn(bool __isLoggedIn) {}

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      __isLoggedIn = false;
    });
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return Loading();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(userData['name']+""),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.doorbell_outlined,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Icon(
                  Icons.person,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  await logout();
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
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
                        Text(
                          "Good " +
                              greeting() +
                              ", " +
                              userData['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Have a nice " + greeting() + " at work",
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/images/lab.jpeg",
                        fit: BoxFit.fill,
                        height: 70,
                        width: 70,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Reports",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center, // This is needed
                        child: FaIcon(
                          FontAwesomeIcons.hospitalUser,
                          size: 50,
                          color: Colors.lightBlue,
                        ),
                      ),
                      Text(
                        "Total Patients",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        totalPatient,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                        alignment: Alignment.center, // This is needed
                        child: FaIcon(
                          FontAwesomeIcons.calendarWeek,
                          size: 50,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        "Appointments",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        orders,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                        alignment: Alignment.center, // This is needed
                        child: FaIcon(
                          FontAwesomeIcons.capsules,
                          size: 50,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        "Closed Bookings",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        approvedBooking,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  color: Colors.grey[200],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "My Appointments",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name"),
                  Text("Phone"),
                  Text("Delivery Address"),
                  Text("Prescription"),
                  Text("Status"),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetails(
                                  _orders[index].id,
                                  _orders[index].name,
                                  _orders[index].location,
                                  _orders[index].prescription,
                                  _orders[index].delivery)));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_orders[index].name),
                            Text(_orders[index].phone),
                            Text(_orders[index].delivery),
                            Text(_orders[index].prescription),

                            Container(
                                child: (_orders[index].status == 1)
                                    ? FaIcon(
                                        FontAwesomeIcons.check,
                                        size: 25,
                                      )
                                    : FaIcon(
                                        FontAwesomeIcons.hourglass,
                                        size: 25,
                                      ))
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
  final int id, status;
  final String name, delivery, prescription,phone;
  final String? location;
  Booking(
      {required this.id,
      required this.status,
      required this.name,
      required this.delivery,
       required this.phone,
      this.location = 'Kuwait',
      required this.prescription});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return new Booking(
      id: json['id'],
      status: json['status'],
      name: json['name'],
      phone: json['phone'],
      delivery: json['delivery'],
      location: json['location'],
      prescription: json['prescription'],
    );
  }
}
