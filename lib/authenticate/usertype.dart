

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:geolocator/geolocator.dart';
class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {


  String _genderRadioBtnVal="patient";
  Position? _currentPosition;
  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
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
                                if(_currentPosition != null) Text(
                                    "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"
                                ),
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
                                    _getCurrentLocation();
                                    Fluttertoast.showToast(msg: _genderRadioBtnVal,toastLength: Toast.LENGTH_SHORT);
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
