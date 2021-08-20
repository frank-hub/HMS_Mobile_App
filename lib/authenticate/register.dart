import 'package:flutter/material.dart';
import 'package:hms/authenticate/login.dart';
import 'package:hms/screens/patient/HomeScreen.dart';
import 'package:hms/services/auth.dart';
import 'package:hms/shared/loading.dart';
import 'package:provider/provider.dart';

Color orangeColors = Color(0xFF6C63FF);
Color orangeLightColors = Color(0xFF6C63FF);

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String msgStatus = '';
Auth  _auth=new Auth();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  bool loading =false;
  Future <void> regUser() async{
    setState(() {
      msgStatus='';
     loading=true;
    });

      bool result = await Provider.of<Auth>(context, listen: false).registerUser(_nameController.text.trim(), _emailController.text.trim().toLowerCase(), _phoneController.text,  _passwordController.text.trim());
      if (result == false) {
        setState(() {
          msgStatus = 'Unauthorized!! Wrong Credentials';
          loading = false;
        });
      }
      else{
        setState(() {
          loading=false;
          // Navigator.push(context,
          //     MaterialPageRoute(
          //         builder: (
          //             context) => HomeScreen()
          //     ));
        });
      }


}
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[

            HeaderContainer("Signup For Service Delivery"),

            Expanded(

              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ListView(

                  children: <Widget>[
                    Text(msgStatus,style: TextStyle(color: Colors.red),),
                    SizedBox(height: 5,),
                    _textInput(hint: "Fullname", icon: Icons.person,controller: _nameController),
                    _textInput(hint: "Email", icon: Icons.email,controller: _emailController),
                    SizedBox(height: 10.0,),
                    _textInput(hint: "Phone Number", icon: Icons.call,controller: _phoneController),
                    _textInput(hint: "Password", icon: Icons.vpn_key,controller: _passwordController),
                    SizedBox(height: 10.0,),

                    ButtonWidget(
                          btnText: "SIGNUP",
                          onClick: () {
                         regUser();
                          },
                        ),
                    SizedBox(height: 20.0,),

                    GestureDetector(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(

                              text: "Already a member ? ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "SIGNIN",
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
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
class HeaderContainer extends StatelessWidget {
  var text = "Signin";
  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
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