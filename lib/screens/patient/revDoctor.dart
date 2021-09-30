import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RevDoctor extends StatefulWidget {
  const RevDoctor({Key? key}) : super(key: key);

  @override
  _RevDoctorState createState() => _RevDoctorState();
}

class _RevDoctorState extends State<RevDoctor> {
  TextEditingController controller = new TextEditingController();
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
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  child: new ListTile(
                    leading: new Icon(Icons.search),
                    title: new TextField(
                      controller: controller,
                      decoration: new InputDecoration(
                          hintText: 'Search : Name /Location', border: InputBorder.none),
                    ),
                  ),
                  ),
                ),
              ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 25),
                padding: EdgeInsets.all(8),
                child: Text("Advertisement",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.6
                ),
                )
            ),
            GestureDetector(
                onTap: (){

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
                        width: 60,
                        height: 60,
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
                              "Dr. Frank",
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
                                Text("Chicago",
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
                                Text("General",
                                    style: TextStyle(
                                        color: primary, fontSize: 13, letterSpacing: .3)),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          
                          children: <Widget>[
                            FaIcon(
                                FontAwesomeIcons.gift
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("200 USD",
                                style: TextStyle(
                                    color: primary, fontSize: 13, letterSpacing: .3)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 210.0,bottom: 30.0),
        child: GestureDetector(
          child: Text("Need Help (Helpline)",
            style: TextStyle(
              color:Colors.brown,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
        ),

      ),
    );
  }
}
