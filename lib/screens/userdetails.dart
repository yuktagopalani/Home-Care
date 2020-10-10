import 'package:flutter/material.dart';
import 'package:wow/screens/signin.dart';
import 'package:wow/utilities/signinutility.dart';
import 'package:wow/screens/home.dart';
import 'package:geolocator/geolocator.dart';
String phone="";
String address="";
class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  double lat=0;
  double long=0;
  Future<void> getLocation() async
  {
    try{
      Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      lat=position.latitude;
      long=position.longitude;
    }
    catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    getLocation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

         TextField(
           onChanged: (value){
             phone=value;
           },

         ),
          TextField(
            onChanged: (value){
              address=value;
            },
          ),
      MaterialButton(
        child: Text("Sign In"),
        color: Colors.red,
        onPressed: (){
          SignInUtil(
              phone: phone,
          address: address,lat: lat,long: long)
              .signInWithGoogle()
              .whenComplete(() {
            Navigator.pop(context);
            Navigator.popUntil(context, ModalRoute.withName('/'));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Home();
                },
              ),
            );
          });
        },
      )

            ],
        ),
      )

    ),
    ),
    ),
    );

  }
}

