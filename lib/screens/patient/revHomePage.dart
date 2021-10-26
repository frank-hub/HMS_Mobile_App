import 'package:flutter/material.dart';
import 'package:hms/authenticate/RegisterSeller.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/authenticate/registerUser.dart';
import 'package:hms/screens/doctor/doctorslist.dart';
import 'package:hms/screens/labaratory/labhome.dart';
import 'package:hms/screens/pharmacy/pharmacylist.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // animationController.dispose() instead of your controller.dispose
  }
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
              title: Text("HMS"),
              actions: [
                IconButton(onPressed:() async{
                  await logout();
                },
                    icon: const Icon( Icons.logout))
              ],
            ),
             body:  Container(
               width: double.infinity,
               decoration: BoxDecoration(
                   gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                     Color(0xFF6C63FF),
                     Color(0xFF5A54C4),
                     Color(0xFF5B55BE),
                   ])),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   SizedBox(
                     height: 10,
                   ),
                   Padding(
                     padding: EdgeInsets.all(20),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Center(
                           child:   Image.asset('assets/images/logo.png',
                             width: 150,
                           ),
                         ),

                       ],
                     ),
                   ),
                   SizedBox(height: 20),
                   Expanded(
                     child: Container(
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(60),
                               topRight: Radius.circular(60))),
                       child: SingleChildScrollView(
                         child: Padding(
                           padding: EdgeInsets.all(30),
                           child: Column(
                             children: <Widget>[
                               SizedBox(
                                 height: 50,
                               ),
                               Container(
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(10),
                                     boxShadow: [
                                       BoxShadow(
                                           color: Color.fromRGBO(
                                               21, 105, 202, 0.30196078431372547),
                                           blurRadius: 20,
                                           offset: Offset(0, 10))
                                     ]),
                                 child: Column(
                                   children: <Widget>[
                                     SizedBox(
                                       height: 30,
                                     ),
                                     Center(
                                       child:    Text(
                                         "Do you need ?",
                                         style: TextStyle(color: Colors.blue, fontSize: 24,fontWeight: FontWeight.bold),
                                       ),
                                     ),
                                     SizedBox(
                                       height: 30,
                                     ),
                                     Center(
                                       child: ConstrainedBox(
                                           constraints: BoxConstraints.tightFor(width: 300, height: 40),
                                           child: ElevatedButton(
                                             style: ButtonStyle(

                                                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                 backgroundColor: MaterialStateProperty.all<Color>( Color(
                                                     0xFF2B258C)),
                                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                     RoundedRectangleBorder(
                                                         borderRadius: BorderRadius.circular(18.0)

                                                     )

                                                 )
                                             ),
                                             onPressed: () {


                                               Navigator.push(context,
                                                   MaterialPageRoute(
                                                       builder: (
                                                           context) => DoctorsList()
                                                   ));
                                             },
                                             child: Text('Doctor'),
                                           )
                                       ),),
                                     SizedBox(
                                       height: 20,
                                     ),
                                     Center(
                                       child: ConstrainedBox(
                                           constraints: BoxConstraints.tightFor(width: 300, height: 40),
                                           child: ElevatedButton(
                                             style: ButtonStyle(
                                                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                     RoundedRectangleBorder(
                                                         borderRadius: BorderRadius.circular(18.0)
                                                     )
                                                 )
                                             ),
                                             onPressed: () {
                                               Navigator.push(context,
                                                   MaterialPageRoute(
                                                       builder: (
                                                           context) => LabHome()
                                                   ));
                                             },
                                             child: Text('Labaratory'),
                                           )
                                       ),),
                                     SizedBox(
                                       height: 30,
                                     ),
                                     Center(
                                       child: ConstrainedBox(
                                           constraints: BoxConstraints.tightFor(width: 300, height: 40),
                                           child: ElevatedButton(
                                             style: ButtonStyle(

                                                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                 backgroundColor: MaterialStateProperty.all<Color>( Color(
                                                     0xFF536B94)),
                                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                     RoundedRectangleBorder(
                                                         borderRadius: BorderRadius.circular(18.0)

                                                     )

                                                 )
                                             ),
                                             onPressed: () {
                                               Navigator.push(context,
                                                   MaterialPageRoute(
                                                       builder: (
                                                           context) => PharmacyList()
                                                   ));
                                             },
                                             child: Text('Pharmacy'),
                                           )
                                       ),),
                                     SizedBox(
                                       height: 40,
                                     ),
                                   ],
                                 ),
                               ),
                               SizedBox(
                                 height: 20,
                               ),
                               Container(
                                 margin: const EdgeInsets.only(right: 210.0),
                                 child: GestureDetector(
                                   child: Text("Register as a Seller",
                                     style: TextStyle(
                                       color:Colors.brown,
                                       fontStyle: FontStyle.italic,
                                       fontSize: 18,
                                     ),
                                   ),
                                   onTap: (){
                                     Navigator.push(context,
                                         MaterialPageRoute(
                                             builder: (
                                                 context) => RegisterSeller()
                                         ));

                                   },
                                 ),

                               )


                             ],
                           ),
                         ),
                       ),
                     ),
                   )
                 ],
               ),
             ),
          ),
        )
    );

  }
}
