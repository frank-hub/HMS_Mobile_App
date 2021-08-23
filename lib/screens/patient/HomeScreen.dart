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

  final Color primary = Color(0xFF6C63FF);
  final Color active = Color(0xff6C48AB);
  var userData;

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
          drawer: _buildDrawer(),
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

  _buildDrawer(){
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color(0xFF4F49D6), Color(0xFF6C63FF)])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage("https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png"),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    ""+userData['name'],
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  Text(
                    userData['email'],
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Your profile"),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Settings"),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us"),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "Help"),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  Widget _buildRow(IconData icon, String title) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
      ]),
    );
  }
}