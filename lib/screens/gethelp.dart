import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wow/models/user.dart';
import 'package:wow/utilities/sharedprefutility.dart';
import 'package:wow/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

import 'home.dart';
Firestore firestoreInstance;
String address="",name="",phone="",desc="",type="";
class GetHelp extends StatefulWidget {
  @override
  _GetHelpState createState() => _GetHelpState();
}
User userLoad;
class _GetHelpState extends State<GetHelp> {

    User user;
  Future fetchUserDetailsFromSharedPref() async {
    var result = await SharedPreferencesUtil.getStringValue(
        Constants.USER_DETAIL_OBJECT);
    Map valueMap = json.decode(result);
    User user = User.fromJson(valueMap);
    setState(() {
      userLoad = user;
      name=userLoad.name;
      address=userLoad.address;
      phone=userLoad.phone;
    });
  }
    TextEditingController a,b,c,d,e;
    void _onPressed() async{
//      name=a.text;
//      phone=b.text;
//      address=c.text;
//      type=d.text;
//      desc=e.text;
      final _firestoreUser =
      Firestore.instance.collection("helplist");
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      final userDoc = _firestoreUser.document(userLoad.uid);
      userDoc.get().then(
            (docsnapshot) => {
          //if (docsnapshot.exists)
          //  {print('Snapshot exists with docID $uid')}
          //else
          //  {
          //print('No existance of doc with docID 123'),
          _firestoreUser.document(userLoad.uid.toString()).setData(
            {
              "uid" : userLoad.uid,
              "name" : name,
              "address" : address,
              "desc" : desc,
              "type" : type,
              "phone" : phone,
              "lat" :userLoad.lat,
              "long": userLoad.long,
            },
          ),
        },
      );
//      firestoreInstance.collection("helplist").document(firebaseUser.uid).setData(
//          {
//            "uid" : userLoad.uid,
//            "name" : name,
//            "address" : address,
//             "desc" : desc,
//            "type" : type,
//             "phone" : phone,
//            "lat" :userLoad.lat,
//            "long": userLoad.long,
//
//          }
//          ).then((value){
//    print("Success");
//    });
    }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetailsFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('GetHelp'),

      ),
      body: ListView(

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Get Help By filling the details !",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Personal Details :",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.person),
              title: TextFormField(
                  initialValue: userLoad.name,
                decoration: new InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (value){
                    name=value;
                },
                controller: a,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextFormField(
                initialValue: userLoad.phone,
                decoration: new InputDecoration(
                  hintText: "Phone",
                ),
                onChanged: (value){
                  phone=value;
                },
                controller: b,
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.home),
              title: new TextFormField(
                initialValue: userLoad.address,
                decoration: new InputDecoration(
                  hintText: "Address",
                ),
                onChanged: (value){
                  address=value;
                },
                controller: c,
              ),
            ),
            const Divider(
              height: 1.0,
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
               "Type of Help you need :", style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
             ),
           ),
            new ListTile(
              leading: const Icon(Icons.local_hospital),
              title: new TextFormField(

                decoration: new InputDecoration(
                  hintText: "Ex. Medicine,Food,etc.",
                ),
                onChanged: (value){
                  type=value;
                },
                controller: d,
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Give description :", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.local_hospital),
              title: new TextFormField(

                decoration: new InputDecoration(
                  hintText: "Ex. I want paracetamol.",
                ),
                onChanged: (value){
                  desc=value;
                },
                controller: e,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                child: Text("Submit"),
          color: Colors.blueAccent,
                onPressed: (){

                      _onPressed();
                      Navigator.popUntil(context, ModalRoute.withName('/'));

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MainPage()));
                },
              ),
            )

          ],
        ),
    );
  }
}
