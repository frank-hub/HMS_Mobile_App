import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/screens/pharmacy/PharmacyDetails.dart';

class HomeScreenPharmacy extends StatefulWidget {
  @override
  _HomeScreenPharmacyState createState() => _HomeScreenPharmacyState();
}

class _HomeScreenPharmacyState extends State<HomeScreenPharmacy> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  child: new ListTile(
                    leading: new Icon(Icons.search),
                    title: new TextField(
                      controller: searchController,
                      decoration: new InputDecoration(
                          hintText: 'Search', border: InputBorder.none),

                    ),
                    trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {

                    },),
                  ),
                ),
              ),
            ),
            Text("Pharmacy Stores",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
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
                                SizedBox(width: 40,),
                                ElevatedButton(
                                  onPressed: (){
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder:
                                    //         (context) => PharmacyDetials()
                                    //     )
                                    // );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[200],
                                    onPrimary: Colors.green,
                                  ),
                                  child:Text("Open"),

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
          ],
        ),
      ),
    );
  }
}
