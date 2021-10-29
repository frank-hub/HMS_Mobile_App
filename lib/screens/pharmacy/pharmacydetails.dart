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
class PharmacyDetails extends StatefulWidget {
  final id;
  final name;
  final charges;
  final location;

  PharmacyDetails(this.id,this.name,this.location,this.charges);

  @override
  PharmacyDetailsState createState() => PharmacyDetailsState();
}

class PharmacyDetailsState extends State<PharmacyDetails> {


  final primary = Color(0xff291747);
  final secondary = Color(0xff6C48AB);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();

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
        title: Text("Order Drugs"),
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
                        hintText: 'Prescription Or Drug Name',
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
                      child:  TextFormField(
                        controller: _deliveryController,
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
                          hintText: 'Delivery Address',
                          hintStyle: GoogleFonts.lato(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: MediaQuery.of(context).size.width,

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
                            _handleOrder();

                          }
                        },
                        child: Text(
                          "Order Drugs",
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

  void _handleOrder() async {
    setState(() {
      loading = true;
    });

    var data = {
      'uid': userData['id'],
      'name' : userData['name'],
      'pharmacy_id' : widget.id,
      'phone' : userData['phone'],
      'location' : widget.location,
      'pharmacy_name' : widget.name,
      'prescription' :  _descriptionController.text,
      'delivery' :  _deliveryController.text,
    };



    var res = await CallApi().postData(data, '/pharmacyorder/store');
    print(data);
    var body = json.decode(res.body);

    if (res.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Alert!!"),
            content: new Text("Order Successfully!"),
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
