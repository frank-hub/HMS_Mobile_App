import 'package:flutter/material.dart';
// ignore: camel_case_types
class revDoctorDetails extends StatefulWidget {
  const revDoctorDetails({Key? key}) : super(key: key);

  @override
  _revDoctorDetailsState createState() => _revDoctorDetailsState();
}

// ignore: camel_case_types
class _revDoctorDetailsState extends State<revDoctorDetails> {
  final primary = Color(0xff291747);
  final secondary = Color(0xff6C48AB);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 100,
        backgroundColor: Color(0xFF5A54C4),
        title: Center(
          child: Image.asset("assets/images/logo.png",
            height: 150,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dr XYZ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: secondary,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Chicago",
                                    style: TextStyle(
                                        color: primary, fontSize: 20, letterSpacing: 0.7)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.school,
                                  color: secondary,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("General",
                                    style: TextStyle(
                                        color: primary, fontSize: 20, letterSpacing: .3)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  color: secondary,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Rs 250",
                                    style: TextStyle(
                                        color: primary, fontSize: 20, letterSpacing: .3)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue
                    ),
                    child: Center(
                      child: GestureDetector(
                        child: Text("Get Appointment",
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                        onTap: (){

                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 210.0),
                    child: GestureDetector(
                      child: Text("Need Help (Helpline)",
                        style: TextStyle(
                          color:Colors.brown,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                    ),

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
