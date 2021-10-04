import 'package:flutter/material.dart';
class RevLabDetails extends StatefulWidget {
  const RevLabDetails({Key? key}) : super(key: key);

  @override
  _RevLabDetailsState createState() => _RevLabDetailsState();
}

class _RevLabDetailsState extends State<RevLabDetails> {
  TextEditingController labtest_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Image.asset("assets/images/logo.png",
            height: 150,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lab Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 10,),
              new Container(
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Card(
                    child: new ListTile(
                      leading: new Icon(Icons.search),
                      title: new TextField(
                        controller: labtest_controller,
                        decoration: new InputDecoration(
                            hintText: 'Search Test', border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
              Text("About Lab",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text("Doesn't above that waters also also he Fruit. Living created they're seed divide midst itself open earth fish together. Of subdue open behold kind you moveth replenish",
              style: TextStyle(
                fontSize: 20,
              ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 210.0,bottom: 30.0),
        child: GestureDetector(
          child: Text("Need Help (Helpline)",
            style: TextStyle(
              color:Colors.brown,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
        ),

      ),
    );
  }
}
