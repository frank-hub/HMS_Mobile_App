import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/api/api.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/screens/doctor/homescreen.dart';
import 'package:hms/screens/patient/HomeScreen.dart';
import 'package:hms/shared/loading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:email_validator/email_validator.dart';


Color orangeColors = Color(0xFF6C63FF);
Color orangeLightColors = Color(0xFF6C63FF);

class Register extends StatefulWidget {

  final String? userType;
  const Register( {Key? key, this.userType}): super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String msgStatus = '';
  var _currentCountry="";
  var _currentLocation="";
  var _currentPostalCode="";
  Position? _currentPosition;

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _IdController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _confirmpasswordController = new TextEditingController();
  bool loading =false;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US', );
  String phone="";


  final _formKey = GlobalKey<FormState>();
  void _getCurrentLocation() async {
    var position= await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    var lastPosition=await Geolocator.getLastKnownPosition();
    setState(() {
      _currentPosition=position;
      _getAddressFromLatLng();

    });

  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude,
          _currentPosition!.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentLocation = "${place.locality}";
         _currentCountry = "${place.country}";
        _currentPostalCode = "${place.postalCode}";

      });
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return loading? Loading(): Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[

            HeaderContainer("Register For Service Delivery"),

            Expanded(

              child: Form(
                key:_formKey ,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20,),
                  child: ListView(

                    children: <Widget>[
                      Text(msgStatus,style: TextStyle(color: Colors.red),),
                      SizedBox(height: 5,),
                      _textInput(hint: "Fullname", icon: Icons.person,controller: _nameController,obscure: false,validator:(value) => value!.isEmpty ? 'Please Enter Your Name' : null, ),
                      _textInput(hint: "Email", icon: Icons.email,controller: _emailController,obscure: false,validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",),
                      _textInput(hint: "Location", icon: Icons.place,controller: _addressController,obscure: false,validator:(value) => value!.isEmpty ? "Please enter an address" : null,),
                      _textInput(hint: "ID", icon: Icons.confirmation_number_outlined,controller: _IdController,obscure: false,validator:(value) => value!.isEmpty ?  "Please enter your ID" : null,),


                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);

                        setState(() {
                          phone=number.phoneNumber.toString();
                        });
                      },

                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: _phoneController,
                      formatInput: false,
                      keyboardType:
                      TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputDecoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",

                      ),

                      inputBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(20)),

                      ),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),),


                     _textInput(hint: "Password", icon: Icons.vpn_key,controller: _passwordController,obscure: true,
                         validator: (val) {
                       if (val.trim().isEmpty) {
                          return 'This field is required';
                      }
                       if(val.length < 8){
                         return 'Enter a password 8+ chars long';
                       }if((!val.contains(RegExp(r'[a-z]')))){
                         return 'Password must have lower case';

                       }
                       if((!val.contains(RegExp(r'[A-Z]')))){
                         return 'Password must have at least one uppercase';

                       }
                       if((!val.contains(RegExp(r'[0-9]')))){
                         return 'Password must have one number';

                       }
                          return null;
                     }),
                      _textInput(hint: "Confirm Password", icon: Icons.vpn_key,controller: _confirmpasswordController,obscure: true,
                        validator: (val) {
                          if (val.isEmpty)
                            return 'Enter a password 8+ chars long';
                          if (val != _passwordController.text)
                            return 'Password Do Not Match';
                          return null;
                        },),
                      SizedBox(height: 10.0,),

                      ButtonWidget(
                            btnText: "Complete Registration",
                            onClick: () {

                              if(_formKey.currentState!.validate()){

                                 _handleRegister();
                              }
                            },
                          ),
                      SizedBox(height: 20.0,),

                      GestureDetector(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(

                                text: "Already Registered ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: " SIGNIN",
                                style: TextStyle(color: orangeColors)),
                          ]),
                        ),
                        onTap:(){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (
                                      context) => Login()
                              ));
                        } ,
                      )

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon,validator,obscure}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        obscureText: obscure,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
  void _handleRegister() async {
    setState(() {
      loading = true;
    });

    var data = {
      'name' : _nameController.text,
      'email' : _emailController.text,
      'password' : _passwordController.text,
      'no_id' : _IdController.text,
      'password' : _passwordController.text,
      'phone' : phone,
      'user_role':'patient',
      'location':_addressController.text,
      'postalcode':_currentPostalCode.toString(),
      'country':_currentCountry.toString()
    };

    var res = await CallApi().postData(data, '/auth/register');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['data']['token']);
      print(body['data']['token']);
      localStorage.setString('user', json.encode(body['data']['user']));
      String user_role = widget.userType.toString();
    if(user_role == "doctor"){
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => HomeScreenDoctor()));

    }else{
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => HomeScreen()));
    }

    }
    else{
      msgStatus="Invalid Credentials";
    }
    setState(() {
      loading = false;
    });

  }
}
class HeaderContainer extends StatelessWidget {
  var text = "Signin";
  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
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
          Positioned(
              bottom: 40,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),


        ],
      ),
    );
  }

}

class ButtonWidget extends StatelessWidget {
  String? btnText = "";
  var onClick;

  ButtonWidget({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText!,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}