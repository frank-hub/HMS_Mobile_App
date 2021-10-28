import 'package:flutter/material.dart';
import 'package:hms/api/api.dart';
import 'package:hms/screens/doctor/homescreen.dart';
import 'package:hms/screens/pharmacy/HomeScreenPharmacy.dart';

class OrderDetails extends StatefulWidget {
  // const BookingDetails({Key? key}) : super(key: key);

  final id;
  final name;
  final location;
  final prescription;
  final delivery;

  OrderDetails(this.id,this.name,this.location,this.delivery,this.prescription);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details for "+ widget.name),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            _approveBooking();
          },
          child: Text('Approve Order'),
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
                      Text(widget.prescription,
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
                      Text(widget.delivery,
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
    var res = await CallApi().updateBooking('/pharmacyorder/status/'+widget.id.toString());
    if(res.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(builder:
          (context) => HomeScreenPharmacy()
      ));
    }else{
      print("Error");
    }
  }
}
