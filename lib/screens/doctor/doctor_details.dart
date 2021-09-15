import 'package:flutter/material.dart';
class DoctorDetails extends StatelessWidget {

  final name;
  final category;
  final location;

  DoctorDetails(this.name,this.category,this.location);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Text(name),
            Text(category),
            Text(location.toString())
          ],
        ),
      ),
    );
  }
}
