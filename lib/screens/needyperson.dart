import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
String name,address,phone,desc,type;
class NeedyPerson extends StatefulWidget {
  String nm,add,phn,des,tp;
  NeedyPerson({this.nm,this.add,this.phn,this.des,this.tp})
  {
    name=this.nm;
    address=this.add;
    phone=this.phn;
    desc=this.des;
    type=this.tp;
  }
  @override
  _NeedyPersonState createState() => _NeedyPersonState();
}

class _NeedyPersonState extends State<NeedyPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name
        ),
      ),
      body: ListView(

        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Problem Details :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          new Divider(
            color: Colors.teal,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Name: $name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Problem Type: $type",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Description: $desc",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  launch(('tel://${phone}'));
                },
                child: Text(
                  "Phone: $phone",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Address: $address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
