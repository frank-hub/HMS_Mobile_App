import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.purple, Colors.blue])
      ),
      child: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("HMS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),),
            Image.asset('assets/images/logo.png'),
            ElevatedButton(
                child: Text(
                    "Get Started".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                      height: 1.7,
                    )
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                        )
                    )
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder:

                ))
            )
          ],
        ),
      ),
    );
  }
}
