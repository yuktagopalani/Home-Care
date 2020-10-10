import 'package:flutter/material.dart';
import 'package:wow/screens/signin.dart';
import 'package:wow/utilities/signinutility.dart';
import 'package:wow/screens/home.dart';
String phone="";
String address="";
class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
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
          address: address)
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

