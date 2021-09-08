import 'dart:convert';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms/api/api.dart';
import 'package:hms/models/doctor.dart';
import 'package:hms/screens/doctor/test.dart';
import 'package:intl/intl.dart';

class UpdateDetails extends StatefulWidget {
  @override
  _UpdateDetailsState createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController = TextEditingController();

  late TextEditingController _phoneController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final format = DateFormat("yyyy-MM-dd");

  var gender = "Male";
  var cat = "General";
  void initState() {
    _fetchJobs();
    super.initState();
  }

  Future<List<Doctor>> _fetchJobs() async {
    var response = await CallApi().getData('/categories');
    // final response = await http.get('http://localhost:8000/api/categories')

    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);

      List<dynamic>? jsonResponse = map["cartegories"];
      print(jsonResponse);
      return jsonResponse!.map((job) => new Doctor.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load Events from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFF6C63FF),
          Color(0xFF5A54C4),
          Color(0xFF5B55BE),
        ])),
        child: FutureBuilder<List<Doctor>>(
          future: _fetchJobs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Doctor>? data = snapshot.data;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Update Details",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(  Radius.circular(40))),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                              key: _formKey,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                padding: EdgeInsets.only(top: 0),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        'Update My Details',
                                        style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Gender",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          width: 250,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[350],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(90.0))),
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: gender,
                                            //elevation: 5,
                                            style:
                                                TextStyle(color: Colors.black),

                                            items: <String>[
                                              'Male',
                                              'Female',
                                              'Other',
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            hint: Text(
                                              "Please Your Gender",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                gender = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Category",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          width: 235,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[350],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(90.0))),
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: cat,
                                            //elevation: 5,
                                            style:
                                                TextStyle(color: Colors.black),

                                            items: data!.map((value) {
                                              return DropdownMenuItem<String>(
                                                value: value.name,
                                                child: Text(value.name),
                                              );
                                            }).toList(),
                                            hint: Text(
                                              "Please Your Gender",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                cat = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: _phoneController,
                                      style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 20, top: 10, bottom: 10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey[350],
                                        hintText: 'Mobile*',
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(90.0)),
                                                borderSide: BorderSide.none,
                                              ),
                                              filled: true,
                                              fillColor: Colors.grey[350],
                                              hintText: 'Date Of Birth*',
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

                                            textInputAction:
                                                TextInputAction.next,
                                            style: GoogleFonts.lato(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            onShowPicker:
                                                (context, currentValue) {
                                              return showDatePicker(
                                                  context: context,
                                                  firstDate: DateTime(1920),
                                                  initialDate: currentValue ??
                                                      DateTime.now(),
                                                  lastDate: currentValue ??
                                                      DateTime.now());
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors
                                                    .indigo, // button color
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
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 2,
                                          primary: Colors.indigo,
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            print(gender);
                                            print(cat);
                                            Fluttertoast.showToast(
                                                msg: cat + " " + gender,
                                                toastLength:
                                                    Toast.LENGTH_SHORT);
                                          }
                                        },
                                        child: Text(
                                          "Update Records",
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ]);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
