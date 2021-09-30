import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
                Text("About HMS",
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ),
          Text("Doesn't above that waters also also he Fruit. Living created they're seed divide midst itself open earth fish together. Of subdue open behold kind you moveth replenish above upon together place.\nTogether open wherein green land god. You'll shall beginning god years night. She'd face land waters seed very fruit night us it land in.Isn't fruit seas god likeness every morning tree lights years doesn't fowl seasons fish tree morning can't let replenish. Made that over i bearing two so bring it rule, created saw Sixth, spirit moveth gathering itself given that give yielding Which made so kind made.",
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
