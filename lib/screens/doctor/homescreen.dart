import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomeScreenDoctor extends StatefulWidget {
  @override
  _HomeScreenDoctorState createState() => _HomeScreenDoctorState();
}

class _HomeScreenDoctorState extends State<HomeScreenDoctor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
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
                          Text("Good Morning Dr. Smith",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Text("Have a nice evening at work",
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
                          "58",
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
                          "448",
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
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopie "),
                            Text("Djibouti"),
                            Text("24/56/2021"),
                            Text("6:40 AM"),
                            FaIcon(FontAwesomeIcons.check,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
