import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hms/api/api.dart';
import 'package:hms/screens/labaratory/labdetails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hms/screens/doctor/doctor_details.dart';

class LabHome extends StatefulWidget {
  @override
  _LabHomeState createState() => new _LabHomeState();
}

class _LabHomeState extends State<LabHome> {
  TextEditingController controller = new TextEditingController();
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);
  final primary = Color(0xff291747);
  final secondary = Color(0xff6C48AB);
  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    _userDetails.clear();
    _searchResult.clear();
    final response = await CallApi().getData('/labs');
    final responseJson = json.decode(response.body);
    TextStyle(color: Colors.black, fontSize: 18);


    final primary = Color(0xff291747);
    final secondary = Color(0xff6C48AB);
    setState(() {
      for (Map<String, dynamic> user in responseJson['labs']) {
        _userDetails.add(UserDetails.fromJson(user));

      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 210.0,bottom: 30.0),
        child: GestureDetector(
          child: Text("Need Help (Helpline) ",
            style: TextStyle(
              color:Colors.brown,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
        ),

      ),
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Image.asset("assets/images/logo.png",
            height: 150,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  child: new ListTile(
                    leading: new Icon(Icons.search),
                    title: new TextField(
                      controller: controller,
                      decoration: new InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: onSearchTextChanged,
                    ),
                    trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },),
                  ),
                ),
              ),
            ),
            Padding(
             padding: EdgeInsets.all(12),
             child: Text("Advertisement",
             style: TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.bold,
             ),
             ),
            ),
            new Expanded(
              child: _searchResult.length != 0 || controller.text.isNotEmpty
                  ? new ListView.builder(
                itemCount: _searchResult.length,
                itemBuilder: (context, i) {
                  return new GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => LabDetails(_searchResult[i].id,_searchResult[i].name,_searchResult[i].charges,_searchResult[i].location)
                        ));
                      },
                      child:Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        height: 110,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 3, color: secondary),
                                image: DecorationImage(
                                    image: NetworkImage("http://pngimg.com/uploads/doctor/doctor_PNG15988.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _searchResult[i].name,
                                    style: TextStyle(
                                        color: primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: secondary,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(_searchResult[i].location.toString(),
                                          style: TextStyle(
                                              color: primary, fontSize: 13, letterSpacing: .3)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.credit_card,
                                        color: secondary,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(_searchResult[i].charges,
                                          style: TextStyle(
                                              color: primary, fontSize: 13, letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  );
                },
              )
                  : new ListView.builder(
                itemCount: _userDetails.length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => LabDetails(_userDetails[index].id,_userDetails[index].name,_userDetails[index].charges,_userDetails[index].location)
                        ));
                      },
                      child:Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        height: 110,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 3, color: secondary),
                                image: DecorationImage(
                                    image: NetworkImage("http://pngimg.com/uploads/doctor/doctor_PNG15988.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _userDetails[index].name,
                                    style: TextStyle(
                                        color: primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: secondary,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(_userDetails[index].location.toString(),
                                          style: TextStyle(
                                              color: primary, fontSize: 13, letterSpacing: .3)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.credit_card,
                                        color: secondary,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(_userDetails[index].charges,
                                          style: TextStyle(
                                              color: primary, fontSize: 13, letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.name.contains(text) || userDetail.location!.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];

final String url ='http://192.168.43.77:8000/api/labs';
class UserDetails {
  final int id;
  final String name, email,charges, profileUrl;
  final String ? location;
  UserDetails({required this.id, required this.name, required this.email,required this.location ,required this.charges, this.profileUrl = 'http://pngimg.com/uploads/doctor/doctor_PNG15988.png'});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      location: json['location'],
      charges: json['charges'],
    );
  }

}