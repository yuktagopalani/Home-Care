import 'package:flutter/material.dart';
import 'package:wow/utilities/signinutility.dart';
import 'package:wow/screens/userdetails.dart';
import '../utilities/signinutility.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            child: Text('Sign Out'),
            color: Colors.red,
            onPressed: (){
              Navigator.pop(context);
              Navigator.popUntil(context, ModalRoute.withName('/'));
              SignInUtil().signOutGoogle();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserDetails()));
            },
          )
        ),
      ),
    );
  }
}
