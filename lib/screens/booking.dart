import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingAppointment extends StatefulWidget {
  const BookingAppointment({Key? key}) : super(key: key);

  @override
  _BookingAppointmentState createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Appointment booking',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
         shrinkWrap: true,
          children: [
            Container(
              child: Image(
              image: AssetImage('assets/images/logo.jpg'),
              height: 250,
                ),
    ),
            SizedBox(height: 20,),
            Form(child:  Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Enter Patient Details',
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
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Please Enter Patient Name';
                      return null;
                    },
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
                      hintText: 'Patient Name*',
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
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
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
                      fillColor: Colors.grey[350],
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
                  TextFormField(
                    controller: _doctorController,
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
                      hintText: 'Doctor Name*',
                      hintStyle: GoogleFonts.lato(
                        color: Colors.black26,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
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
                        TextFormField(
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
                            hintText: 'Select Date*',
                            hintStyle: GoogleFonts.lato(
                              color: Colors.black26,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          controller: _dateController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Please Enter the Date';
                            return null;
                          },

                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.lato(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                        TextFormField(

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
                            hintText: 'Select Time*',
                            hintStyle: GoogleFonts.lato(
                              color: Colors.black26,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          controller: _timeController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Please Enter the Time';
                            return null;
                          },

                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.lato(
                              fontSize: 18, fontWeight: FontWeight.bold),
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

                      },
                      child: Text(
                        "Book Appointment",
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
    ],)
    );
  }
}