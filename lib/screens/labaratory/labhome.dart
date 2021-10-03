import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/screens/pharmacy/PharmacyDetails.dart';
class LabHome extends StatefulWidget {
  const LabHome({Key? key}) : super(key: key);

  @override
  _LabHomeState createState() => _LabHomeState();
}

class _LabHomeState extends State<LabHome> {
  TextEditingController controller = new TextEditingController();
  final primary = Color(0xff291747);
  final secondary = Color(0xff6C48AB);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Image.asset("assets/images/logo.png",
            height: 150,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
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
                margin: EdgeInsets.only(left: 20),
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
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image.asset("assets/images/logo.png",
                              fit: BoxFit.fill,
                              height: 90,
                              width: 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 8,),
                                Text("Smart Lab",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("Nairobi Kenya",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FaIcon(FontAwesomeIcons.mapMarked ,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 8,),
                                    Text("Urinal Test Discount",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  height: 34,
                                  width: 54,
                                  child: Center(child: Text("New",
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
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
