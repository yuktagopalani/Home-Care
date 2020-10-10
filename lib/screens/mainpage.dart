import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage:AssetImage('assets/flutter_logo.png'),
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
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
