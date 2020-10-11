import 'package:flutter/material.dart';
import 'package:wow/screens/signin.dart';
import 'package:wow/utilities/signinutility.dart';
import 'package:wow/screens/home.dart';
import 'package:geolocator/geolocator.dart';

import 'home.dart';
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
                    Center(
                      child: Image(
                        image: AssetImage('assets/gLogo.png'),
                        height: 100.0,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextField(
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your phone no.',
                      ),

                      onChanged: (value){
                        phone=value;
                      },


                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your Address',
                      ),
                      onChanged: (value){
                        address=value;
                      },
                    ),
                    SizedBox(height: 20),


                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 70.0, right: 70.0),
                        child: RaisedButton(
                          textColor: Colors.black,
                          color: Colors.white12,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Sign In with Google",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
//              fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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
                                    return MainPage();
                                  },
                                ),
                              );
                            });
                          },

                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              )

          ),
        ),
      ),
    );

  }
}
