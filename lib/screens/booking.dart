import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:hms/api/api.dart';
import 'package:hms/models/user.dart';
import 'package:hms/screens/patient/HomeScreen.dart';
import 'package:hms/screens/patient/profile.dart';
import 'package:hms/shared/loading.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BookingAppointment extends StatefulWidget {
  const BookingAppointment({Key? key}) : super(key: key);

  @override
  _BookingAppointmentState createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {

  var userData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();
   bool loading=false;

  @override
  void initState() {
    super.initState();
    _getUserInfo();

  }

  void _handleBooking() async {
    setState(() {
      loading = true;
    });


    var data = {
      'name' : '',

    };

    var res = await CallApi().postData(data, '/booking/store');
    print(data);
    var body = json.decode(res.body);

    if (res.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Alert!!"),
            content: new Text("Appointment Booked Successfully!"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => HomeScreen()));

    }

    setState(() {
      loading = false;
    });

  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;

    });

  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return Loading();
    }
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: Expanded(
                flex:5,
                child: ListView(
                    scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            CircleAvatar(
                              radius: 40.0,
                              backgroundImage:
                              NetworkImage("https://e7.pngegg.com/pngimages/439/108/png-clipart-medical-laboratory-analisi-clinica-physician-pharmacist-doctor-patient-service-laboratory.png"),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text("Mj Labs",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("Nairobi Kenya",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FaIcon(FontAwesomeIcons.mapMarked ,
                                      size: 15,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 10,),
                                    Text("14 KM Away",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}


