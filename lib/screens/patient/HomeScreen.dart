import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/screens/booking.dart';
import 'HomeWidget.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int _currentIndex = 0;
final List<Widget> _children = [
  HomeWidget(),
  BookingAppointment(),
  HomeWidget(),
  BookingAppointment(),
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
                Icons.person),
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
              icon: new FaIcon(FontAwesomeIcons.capsules),
              label: 'Pharmacy',
            ),
            BottomNavigationBarItem(
              icon: new FaIcon(FontAwesomeIcons.calendarDay),
              label: 'Bookings'
            ),
            BottomNavigationBarItem(
              icon: new FaIcon(FontAwesomeIcons.syringe),
              label: 'Lab'
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
