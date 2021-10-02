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
        padding: EdgeInsets.all(10),
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
                child:Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Card(
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
                                    SizedBox(width: 17,),
                                    ElevatedButton(
                                      onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (context) => PharmacyDetials()
                                            )
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[200],
                                        onPrimary: Colors.green,
                                      ),
                                      child:Text("New", style: TextStyle(color: Colors.red),),

                                    )
                                  ],
                                ),
                                SizedBox(height: 10,)
                              ],
                            )
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
