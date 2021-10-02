
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/shared/RadioButton/radio_option.dart';
import 'package:intl/intl.dart';
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String? _groupValue;
  final image = "assets/images/logo.png";
  final TextStyle subtitle = TextStyle(fontSize: 12.0, color: Colors.grey);
  final TextStyle label = TextStyle(fontSize: 14.0, color: Colors.grey);

  var dateToday ;
  var timeToday ;
  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('PAYMENT'),
        backgroundColor: Color(0xFF5A54C4),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Image.asset("assets/images/logo.png",
            height: 100,
          ),
        ),
    ),
         Container(
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
                   height: 10,
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

                       SizedBox(height: 15,),
                       Center(
                         child:Text("Choose Your Payment Method",style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.brown ),) ,
                       ),
                       SizedBox(height: 10,),
                       MyRadioOption<String>(
                         value: 'Credt/Debit',
                         groupValue: _groupValue,
                         onChanged: _valueChangedHandler(),
                         label: '1',
                         text: 'Credit/Debit Card',
                         image: 'assets/images/creditcard.png',
                       ),
                       MyRadioOption<String>(
                         value: 'Cash On Delivery',
                         groupValue: _groupValue,
                         onChanged: _valueChangedHandler(),
                         label: '2',
                         text: 'Cash On Delivery',
                         image: 'assets/images/cod.png',
                       ),
                       MyRadioOption<String>(
                         value: 'PayPal',
                         groupValue: _groupValue,
                         onChanged: _valueChangedHandler(),
                         label: '3',
                         text: 'PayPal              ',
                         image: 'assets/images/paypal.png',
                       ),
                       MyRadioOption<String>(
                         value: 'Google Wallet',
                         groupValue: _groupValue,
                         onChanged: _valueChangedHandler(),
                         label: '4',
                         text: 'Google Wallet',
                         image: 'assets/images/googlewallet.png',
                       ),
                       SizedBox(height: 30,),

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

                                 setState(() {
                                   dateToday= new DateFormat('yyyy-MM-dd').format(DateTime.now());
                                   timeToday= new DateFormat().add_jm().format(DateTime.now());

                                 });
                                 _paymentSuccessDialog(context);
                                 //Fluttertoast.showToast(msg: ""+_groupValue.toString(),toastLength: Toast.LENGTH_SHORT);
                                 // Navigator.push(context,
                                 //     MaterialPageRoute(
                                 //         builder: (
                                 //             context) => ()
                                 //     ));
                               },
                               child: Text('PAY'),
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
                     child: Text("Need Help (Helpline)",
                       style: TextStyle(
                         color:Colors.brown,
                         fontStyle: FontStyle.italic,
                         fontSize: 18,
                       ),
                     ),
                   ),

                 )


               ],
             ),
           ),
         ),
         ),

          ],
        ),
      ),
    );
  }
  _paymentSuccessDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PaymentSuccessDialog();
        });
  }

  Widget PaymentSuccessDialog() {
    return Center(
      child: SizedBox(
        height: 390,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Thank You!",
                  style: TextStyle(color: Colors.green),
                ),
                Text(
                  "Your transaction was successful",
                  style: label,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "DATE",
                      style: label,
                    ),
                    Text("TIME", style: label)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(""+dateToday.toString()), Text(""+timeToday.toString())],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "TO",
                          style: label,
                        ),
                        Text("HMS"),
                        Text(
                          "hms.payment@gmail.com",
                          style: subtitle,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      backgroundImage: AssetImage(image),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "AMOUNT",
                          style: label,
                        ),
                        Text("\$ 15000"),
                      ],
                    ),
                    Text(
                      "COMPLETED",
                      style: label,
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.account_balance_wallet),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(""+_groupValue.toString()),
                          Text(
                            "Account No: ***5",
                            style: subtitle,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

