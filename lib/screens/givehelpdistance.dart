import 'package:flutter/material.dart';
import 'package:wow/screens/needylist.dart';


class GetDistance extends StatefulWidget {
  @override
  _GetDistanceState createState() => _GetDistanceState();
}
double km=5;
class _GetDistanceState extends State<GetDistance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search by Distance'
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Enter the Radius(in KM) in which you want to find Needy !',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter radius in KM',
                ),
                onChanged: (value){
                  km=double.parse(value);
                },

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: RaisedButton(
                textColor: Colors.teal,
                color: Colors.white,
                child: Text("Find People",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GetList(kmm: km,)));
                },
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
