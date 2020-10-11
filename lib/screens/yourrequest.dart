import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wow/screens/home.dart';
import 'package:wow/screens/gethelp.dart';
import 'home.dart';
Firestore firestorInstance;
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
      body: name==null? Center(
       child: Text("No Request by you !")
      ): ListView(

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
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: RaisedButton(
              textColor: Colors.teal,
              color: Colors.white,
              child: Text("Mark As Done",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),),
              onPressed: () async{
                var firebaseUser = await FirebaseAuth.instance.currentUser();
                Firestore.instance.collection("helplist").document(firebaseUser.uid).delete().then((_) {
                  print("success!");
                });
                Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName('/'));

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainPage()));
              },

              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: RaisedButton(
              textColor: Colors.teal,
              color: Colors.white,
              child: Text("Edit Your Request",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),),
              onPressed: () async{

                Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName('/'));

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GetHelp()));
              },

              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
