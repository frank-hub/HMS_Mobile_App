import 'dart:convert';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms/api/api.dart';
import 'package:hms/payment/paymentmethod.dart';
import 'package:hms/screens/patient/HomeScreen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LabDetails extends StatefulWidget {
  final id;
  final name;
  final charges;
  final location;

  LabDetails(this.id,this.name,this.location,this.charges);

  @override
  LabDetailsState createState() => LabDetailsState();
}

class LabDetailsState extends State<LabDetails> {


  final primary = Color(0xff291747);
  final secondary = Color(0xff6C48AB);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  bool loading=false;
  final format = DateFormat("yyyy-MM-dd");
  final time_format = DateFormat("HH:MM");
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: AppBar(
        title: Text("Book Appointment"),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 50,),
            Container(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 115,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3, color: secondary),
                        image: DecorationImage(
                            image: NetworkImage("http://pngimg.com/uploads/doctor/doctor_PNG15988.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: secondary,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(widget.location.toString(),
                                  style: TextStyle(
                                      color: primary, fontSize: 13, letterSpacing: .3)),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),

                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.school,
                                color: secondary,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(widget.charges,
                                  style: TextStyle(
                                      color: primary, fontSize: 13, letterSpacing: .3)),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Description',
                        hintStyle: GoogleFonts.lato(
                          color: Colors.black26,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          DateTimeField(
                            format: format,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                top: 10,
                                bottom: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Select Date*',
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black26,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            controller: _dateController,
                            // validator: (value) {
                            //   if (value!.day)
                            //     return 'Please Enter the Date';
                            //   // return null;
                            // },

                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.lato(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: currentValue ?? DateTime.now(),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: ClipOval(
                              child: Material(
                                color: Colors.indigo, // button color
                                child: InkWell(
                                  // inkwell color
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.date_range_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {

                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          DateTimeField(
                            format: time_format,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                top: 10,
                                bottom: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Select Time*',
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black26,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            controller: _timeController,
                            // validator: (value) {
                            //   if (value!.day)
                            //     return 'Please Enter the Date';
                            //   // return null;
                            // },

                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.lato(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                              );
                              return DateTimeField.convert(time);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: ClipOval(
                              child: Material(
                                color: Colors.indigo, // button color
                                child: InkWell(
                                  // inkwell color
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.timer_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {

                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.indigo,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            _handleBooking();

                          }
                        },
                        child: Text(
                          "Book Lab Appointment",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleBooking() async {
    setState(() {
      loading = true;
    });

    var data = {
      'uid': userData['id'],
      'name' : userData['name'],
      'phone' : userData['phone'],
      'location' : widget.location,
      'lab_name' : widget.name,
      'date' :  _dateController.text,
      'time' : _timeController.text,

    };

    var res = await CallApi().postData(data, '/labbooking/store');
    print(data);
    var body = json.decode(res.body);

    if (res.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Alert!!"),
            content: new Text("Lab Booking Successfully!"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      Navigator.push(context, MaterialPageRoute(builder:
          (context) => PaymentMethod(name:widget.name,charges: widget.charges,)
      ));

      setState(() {
        loading = false;
      });

    }
  }

}
