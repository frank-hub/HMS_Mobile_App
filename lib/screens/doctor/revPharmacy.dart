import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RevPharmacy extends StatefulWidget {
  const RevPharmacy({Key? key}) : super(key: key);

  @override
  _RevPharmacyState createState() => _RevPharmacyState();
}

class _RevPharmacyState extends State<RevPharmacy> {
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
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Card(
                    child: Row(
                      children: [
                        Image.asset("assets/images/logo.png",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 90,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 8,),
                            Text("Site Pharmacy",
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
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 10,),
                                Text("14 KM Away",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
