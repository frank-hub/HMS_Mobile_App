import 'package:flutter/material.dart';
import 'package:hms/api/api.dart';
import 'package:hms/screens/doctor/homescreen.dart';
import 'package:hms/screens/labaratory/MyLab.dart';

class MyLabDetails extends StatefulWidget {
  // const BookingDetails({Key? key}) : super(key: key);

  final id;
  final name;
  final location;
  final date;
  final time;

  MyLabDetails(this.id,this.name,this.location,this.date,this.time);

  @override
  _MyLabDetailsState createState() => _MyLabDetailsState();
}

class _MyLabDetailsState extends State<MyLabDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab Booking Details for "+ widget.name),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            _approveBooking();
          },
          child: Text('Approve Appointment'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 20),
          child: Card(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person,
                        size: 30,
                      ),
                      Text(widget.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,

                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_city,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(widget.location,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,

                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.date_range,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(widget.date,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,

                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.lock_clock,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(widget.time,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,

                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
  void _approveBooking() async {
    var res = await CallApi().updateBooking('/labbooking/status/'+widget.id.toString());
    print(res.body.toString());
    if(res.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(builder:
          (context) => MyLab()
      ));
    }else{
      print("Error");
    }
  }
}
