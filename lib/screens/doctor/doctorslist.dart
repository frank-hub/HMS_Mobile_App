import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms/api/api.dart';
import 'package:hms/models/DoctorList.dart';
import 'package:hms/screens/doctor/doctor_details.dart';

class DoctorListView extends StatefulWidget {
  @override
  _DoctorListViewState createState() => _DoctorListViewState();
}

class _DoctorListViewState extends State<DoctorListView> {
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff291747);
  final secondary = Color(0xff6C48AB);

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 3),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children:[
              Container(
                padding: EdgeInsets.only(top: 80),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child:Center(
                  child: Flexible(
                    child: FutureBuilder<List<DoctorList>>(
                      future: _fetchJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<DoctorList>? data = snapshot.data;
                          return _jobsListView(data);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          controller: editingController,
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                            onChanged: (value) {
                              setState(() {});
                            },
                          decoration: InputDecoration(
                              hintText: "Search Doctor",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  Future<List<DoctorList>> _fetchJobs() async {
    var response = await CallApi().getData('/doctors/all');
    // final response = await http.get('http://localhost:8000/api/categories');
    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);

      List<dynamic> ? jsonResponse = map["doctors"];
      print(jsonResponse);
      return jsonResponse!.map((job) => new DoctorList.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load Events from API');
    }
  }
  ListView _jobsListView(data) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, index) {

          return _gestureDetector(data[index].id, data[index].name,data[index].category,data[index].location);
        });


  }
  GestureDetector _gestureDetector(int id,String name,String category,String ? location) => GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:
      (context) => DoctorDetails(id,name,category,location)
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
                    "Dr. "+name,
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
                      Text(location.toString(),
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
                        Icons.school,
                        color: secondary,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(category,
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
}
