import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: Container(
        padding: EdgeInsets.all(20),
        child:Column(
          children: [
            Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png',
                      width: 250,
                    ),
                    Text("Help / FAQs",
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 20,),
            Text("How do I register as a patient",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            Text("pirit moveth gathering itself given that give yielding Which made so kind made.",
              style: TextStyle(
                  fontSize: 19,
                  letterSpacing: 0.6,
                  color: Colors.black45
              ),
            ),
            SizedBox(height: 20,),
            Text("How do I register as a Doctor",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            Text("pirit moveth gathering itself given that give yielding Which made so kind made.",
              style: TextStyle(
                  fontSize: 19,
                  letterSpacing: 0.6,
                  color: Colors.black45
              ),
            ),
            SizedBox(height: 20,),
            Text("How do I register as a Pharmacy",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            Text("pirit moveth gathering itself given that give yielding Which made so kind made.",
              style: TextStyle(
                  fontSize: 19,
                  letterSpacing: 0.6,
                  color: Colors.black45
              ),
            )
          ],
        ),
      ),
    );
  }
}
