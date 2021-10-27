import 'package:flutter/material.dart';

class BookingDetails extends StatefulWidget {
  // const BookingDetails({Key? key}) : super(key: key);

  final id;
  final name;
  final location;
  final date;
  final time;

  BookingDetails(this.id,this.name,this.location,this.date,this.time);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Details for "+ widget.name),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        height: 70,
        child: ElevatedButton(
          onPressed: () {},
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
}
