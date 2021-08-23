import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/screens/booking.dart';
import 'package:hms/utils/Oval_right_clipper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeWidget.dart';
class HomeScreen extends StatefulWidget {

  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final Color primary = Color(0xff291747);
  final Color active = Color(0xff6C48AB);

  final List<Widget> _children = [
    HomeWidget(),
    BookingAppointment(),
    HomeWidget(),
    BookingAppointment(),

  ];

  set __isLoggedIn(bool __isLoggedIn) {}

  logout()  async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      __isLoggedIn=false;
    });
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Login()));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF6C63FF),
            toolbarHeight: 70,
            title: Text("HMS"),
            actions: [
              IconButton(icon: const Icon(
                  Icons.person),
                  tooltip: 'FAQ',
                  onPressed: (){
                    logout();
                  }
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
                  icon: new FaIcon(FontAwesomeIcons.calendarDay),
                  label: 'Bookings'
              ),
              BottomNavigationBarItem(
                icon: new FaIcon(FontAwesomeIcons.capsules),
                label: 'Pharmacy',
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