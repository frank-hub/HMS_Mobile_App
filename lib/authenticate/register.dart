import 'package:flutter/material.dart';

Color orangeColors = Color(0xff6dcae7);
Color orangeLightColors = Color(0xff5eeadf);

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    _textInput(hint: "Fullname", icon: Icons.person),
                    _textInput(hint: "Email", icon: Icons.email),
                    SizedBox(height: 10.0,),
                    _textInput(hint: "Phone Number", icon: Icons.call),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                    SizedBox(height: 10.0,),

                    ButtonWidget(
                          btnText: "SIGNUP",
                          onClick: () {
                            Navigator.pop(context);
                          },
                        ),
                    SizedBox(height: 20.0,),

                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already a member ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "SIGNIN",
                            style: TextStyle(color: orangeColors)),
                      ]),
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