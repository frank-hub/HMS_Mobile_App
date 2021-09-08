import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UpdateDetails extends StatefulWidget {
  @override
  _UpdateDetailsState createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController =TextEditingController();

  late TextEditingController _phoneController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final format = DateFormat("yyyy-MM-dd");
  var category ="General";
  var gender ="Male";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color(0xFF6C63FF),
                Color(0xFF5A54C4),
                Color(0xFF5B55BE),
              ])),
          child: new Column(
            children: [
              SizedBox(height: 100,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all( Radius.circular(40))),
                child:ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 20,),
                    Form(
                        key: _formKey,
                        child:  Container(
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
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(

                                children: [
                                  Text("Gender:",style: TextStyle(fontSize: 20),),
                                  SizedBox(width: 30,),
                                  Container(
                                    width: 250,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[350],
                                        borderRadius: BorderRadius.all(Radius.circular(90.0))),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: gender,
                                      //elevation: 5,
                                      style: TextStyle(color: Colors.black),

                                      items: <String>[
                                        'Male',
                                        'Female',
                                        'Other',

                                      ].map<DropdownMenuItem<String>>((String value) {
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
                                      onChanged: (String ? value) {
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
                                  Text("Specialization:",style: TextStyle(fontSize: 20),),
                                  SizedBox(width: 30,),
                                  Container(
                                    width: 200,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[350],
                                        borderRadius: BorderRadius.all(Radius.circular(90.0))),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: category,
                                      //elevation: 5,
                                      style: TextStyle(color: Colors.black),

                                      items: <String>[
                                        'General',
                                        'Pregnancy',
                                        'Pediatrician',

                                      ].map<DropdownMenuItem<String>>((String value) {
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
                                      onChanged: (String ? value) {
                                        setState(() {
                                          category = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30,),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                controller:  _phoneController,

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
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(90.0)),
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

                                      textInputAction: TextInputAction.next,
                                      style: GoogleFonts.lato(
                                          fontSize: 18, fontWeight: FontWeight.bold),
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1920),
                                            initialDate: currentValue ?? DateTime.now(),
                                            lastDate:currentValue ?? DateTime.now());
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
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()){

                                    }
                                  },
                                  child: Text(
                                    "Save",
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
                  ],),
              )
            ],
          )
        ),

      ),
    );
  }
}
