import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms/api/api.dart';
import 'package:hms/models/doctor.dart';

class MyAppointment extends StatefulWidget {
  @override
  _MyAppointmentState createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointment'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children:[

          Center(
            child: Flexible(
              child: FutureBuilder<List<Doctor>>(
                future: _fetchJobs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Doctor>? data = snapshot.data;
                    return _jobsListView(data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
  Future<List<Doctor>> _fetchJobs() async {

    var response = await CallApi().getData('/categories');
    // final response = await http.get('http://localhost:8000/api/categories');
    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);

      List<dynamic> ? jsonResponse = map["cartegories"];
      print(jsonResponse);
      return jsonResponse!.map((job) => new Doctor.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load Events from API');
    }
  }
  ListView _jobsListView(data) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _gestureDetector(data[index].id, data[index].name,);
        });

  }

  GestureDetector _gestureDetector(int id,String name ) => GestureDetector(
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                name,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),

              Text(
                id.toString(),
                style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}