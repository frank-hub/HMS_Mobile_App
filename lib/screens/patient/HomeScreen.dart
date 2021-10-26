import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/screens/booking.dart';
import 'package:hms/screens/doctor/doctorslist.dart';
import 'package:hms/screens/patient/profile.dart';
import 'package:hms/screens/pharmacy/HomeScreenPharmacy.dart';
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
  //  RevDoctor(),
    HomeScreenPharmacy(),
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
    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return true when click on "Yes"
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: showExitPopup,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF6C63FF),
                toolbarHeight: 70,
                title: Text("HMS"),
                actions: [
                  IconButton(icon: const Icon(
                      Icons.person),
                      tooltip: 'FAQ',
                      onPressed: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Profile()));
                      }
                  ),
                  IconButton(onPressed:() async{
                    await logout();
                  },
                      icon: const Icon( Icons.logout))
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
                      label: 'Doctors'
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
          )
    );

  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}