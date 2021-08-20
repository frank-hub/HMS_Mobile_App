import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/models/user.dart';
import 'package:hms/services/auth.dart';
import 'package:hms/shared/loading.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Auth _auth = new Auth();
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, auth, child) {
        if (auth.user == null) {
          return Loading();
        }
        return Container(
            padding: EdgeInsets.all(20),
            child: Consumer<Auth>(
              builder: (context, auth, child) {
                return Column(
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
                              "Good Morning, " + auth.user!.name,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              // bottom: 1,
                              child: Text(auth.user!.phone.toString(),
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
                    Card(
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
                                        "Dr. John Doe,",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        // bottom: 1,
                                        child: Text(
                                          "General Practitioner",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: FaIcon(
                                          FontAwesomeIcons.arrowAltCircleRight))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FaIcon(FontAwesomeIcons.clock),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Friday , March 26 @ 9:00 am")
                                ],
                              ),
                            ],
                          ),
                        )),
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
                );
              },
            ));

      },
    );
  }
}
