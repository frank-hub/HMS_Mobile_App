import 'package:flutter/material.dart';

import 'HomeWidget.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int _currentIndex = 0;
final List<Widget> _children = [
  HomeWidget(),
  HomeWidget(),
  HomeWidget(),
  HomeWidget(),
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6C63FF),
          toolbarHeight: 70,
          title: Text("HMS"),
          actions: [
            IconButton(icon: const Icon(
                Icons.question_answer),
                tooltip: 'FAQ',
                onPressed: (){}
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          selectedItemColor: Color(0xFF6C63FF),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.message_rounded),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today_outlined),
              label: 'Bookings'
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_pin_outlined),
              label: 'Profile'
            )

          ],

        ),
        body: _children[_currentIndex]
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
