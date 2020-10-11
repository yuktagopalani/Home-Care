import 'package:flutter/material.dart';
import 'package:wow/utilities/signinutility.dart';
import 'package:wow/screens/userdetails.dart';
import '../utilities/signinutility.dart';
import 'package:wow/screens/gethelp.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.t
      body: SafeArea(

        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover)
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70.0,
                backgroundImage:AssetImage('assets/home_logo.png'),
              ),
              SizedBox(
                height: 30.0,
                width: 200.0,
//                child: Divider(
//                  color: Colors.teal.shade100,
//                ),
              ),
              Center(
                child: Text("Welcome to Home Care",
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
//               fontStyle: FontStyle.pa,
                    fontSize: 30.0,

                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 200.0,
//                child: Divider(
//                  color: Colors.teal.shade100,
//                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: RaisedButton(
                  textColor: Colors.teal,
                  color: Colors.white,
                  child: Text("Give Help",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
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
                  child: Text("Take Help",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GetHelp()));
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
                  child: Text("Sign Out",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                    SignInUtil().signOutGoogle();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserDetails()));
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
