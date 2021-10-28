import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PharmacyDetials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text("Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/corona.png",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Covid 19",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/bloodpressure.png",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Blood Pressure",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/painkillers.jpg",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Pain Killers",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/stomach.jpg",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Stomach",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/epilepcy.jpg",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Epilepsy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/pancreatics.png",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Pancreatics",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/neuropills.jpg",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Neuro Pills",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/immune.jpg",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Immune System",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.asset("assets/images/other.jpg",
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                        ),
                      ),
                      Text("Other",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
