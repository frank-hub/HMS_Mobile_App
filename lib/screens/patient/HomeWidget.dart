import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            children: [
              Text("Good Morning "),
              Text("John Doe"),
            ],
          ),
          CircleAvatar(
            child: Image.asset('assets/images/logo.png'),
          )
        ],
      ),
    );
  }
}
