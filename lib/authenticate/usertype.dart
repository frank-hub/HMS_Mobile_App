import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hms/screens/doctor/homescreen.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  String _genderRadioBtnVal="patient";
  String currentAddress = 'My Address';
  Position? currentposition;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
    return position;
  }


  void _handleGenderChange(String ? value) {
    setState(() {
      _genderRadioBtnVal = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            /////////////  background/////////////
            new Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.4, 0.9],
                  colors: [
                    Color(0xFF6C63FF),
                    Color(0xFF5A54C4),
                    Color(0xFF5B55BE),
                  ],
                ),
              ),
            ),

            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Select Your Role : ",style: TextStyle(color: Colors.black,fontSize: 25),),
                                ListTile(
                                  title: Text("Patient",style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),
                                  leading: Radio(
                                    value: "patient",
                                    groupValue: _genderRadioBtnVal,
                                    onChanged: _handleGenderChange,
                                    activeColor: Colors.green,
                                  ),
                                ),
                                ListTile(
                                  title: Text("Doctor",style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),
                                  leading: Radio(
                                    value: "doctor",
                                    groupValue: _genderRadioBtnVal,
                                    onChanged: _handleGenderChange,
                                    activeColor: Colors.green,
                                  ),
                                ),
                                ListTile(
                                  title: Text("Pharmacy",style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),
                                  leading: Radio(
                                    value: "pharmacy",
                                    groupValue: _genderRadioBtnVal,
                                    onChanged: _handleGenderChange,
                                    activeColor: Colors.green,
                                  ),
                                ),
                                ListTile(
                                  title: Text("Lab",style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),
                                  leading: Radio(
                                    value: "lab",
                                    groupValue: _genderRadioBtnVal,
                                    onChanged: _handleGenderChange,
                                    activeColor: Colors.green,
                                  ),
                                ),
                              ],

                            ),
                            Padding(padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  if(currentAddress != "") Text(
                                      currentAddress,
                                      style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo) ),
                                  if(currentposition !=null) Text(
                                      'Longitute: '+currentposition!.longitude.toString()+', Latitude: '+currentposition!.latitude.toString(),
                                      style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo) ),
                                ],
                              ),
                            ),

                            /////////////// SignUp Button ////////////
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      'Complete Registration',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Color(0xFF5B55BE),
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(20.0)),
                                  onPressed: (){
                                    _determinePosition();
                                    Fluttertoast.showToast(msg: _genderRadioBtnVal,toastLength: Toast.LENGTH_SHORT);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreenDoctor()
                                    ));
                                  }
                              ),
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
      ),
    );

  }
}
