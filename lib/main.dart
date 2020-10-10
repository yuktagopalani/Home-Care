import 'package:flutter/material.dart';
import 'package:wow/utilities/constants.dart';
import 'package:wow/utilities/sharedprefutility.dart';
import 'package:wow/screens/home.dart';
import 'package:wow/screens/userdetails.dart';
import 'package:wow/screens/blank.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Constants.SKYBLUE,
        fontFamily: 'Montserrat',
        primaryColor: Constants.DARK_SKYBLUE,
        backgroundColor: Colors.white,
        primaryIconTheme: IconTheme.of(context).copyWith(color: Colors.white),
        indicatorColor: Constants.WHITE,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Constants.WHITE,
          labelStyle:
          TextStyle(fontWeight: FontWeight.w600, color: Constants.WHITE),
          unselectedLabelColor: Constants.SKYBLUE,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          },
        ),
      ),
      title: 'SemBreaker',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: SharedPreferencesUtil.getBooleanValue(Constants.USER_LOGGED_IN),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data ? MainPage() : UserDetails();
          } else
            return Blank();
        },
      ),
    );
  }
}

