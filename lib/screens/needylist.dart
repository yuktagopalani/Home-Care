import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wow/models/user.dart';
import 'package:wow/utilities/sharedprefutility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'package:wow/utilities/constants.dart';
import 'package:wow/screens/needyperson.dart';

double km;
User user,userLoad;
String name,address,phone;
class GetList extends StatefulWidget {
  double kmm;
  GetList({this.kmm}){
   km=kmm;
  }

  @override
  _GetListState createState() => _GetListState();
}

class _GetListState extends State<GetList> {
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

  double toRadians(double degree) {
    double one_deg = (pi) / 180;
    return (one_deg * degree);
  }

  double distance(double lat1, double long1, lat2, double long2) {
    lat1 = toRadians(lat1);
    long1 = toRadians(long1);
    lat2 = toRadians(lat2);
    long2 = toRadians(long2);

    // Haversine Formula
    double dlong = long2 - long1;
    double dlat = lat2 - lat1;

    double ans = pow(sin(dlat / 2), 2) +
        cos(lat1) * cos(lat2) *
            pow(sin(dlong / 2), 2);

    ans = 2 * asin(sqrt(ans));

    // Radius of Earth in
    // Kilometers, R = 6371
    // Use R = 3956 for miles
    double R = 6371;

    // Calculate the result
    ans = ans * R;

    return ans;
  }
@override
  void initState() {
    // TODO: implement initState
  fetchUserDetailsFromSharedPref();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Needy People in $km km radius"
        ),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("helplist").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              List <ListItem> list=[];
              List<Widget> messageWidget = [];
              if (!snapshot.hasData) return new Text("No nearby person !");
              else
                {

                  for(int i=0;i<snapshot.data.documents.length;i++)
                    {
                      if(km>=distance(snapshot.data.documents[i]["lat"], snapshot.data.documents[i]["long"], userLoad.lat, userLoad.long) && userLoad.uid!=snapshot.data.documents[i]["uid"]){
                          ListItem lis =(ListItem(name:snapshot.data.documents[i]["name"],address: snapshot.data.documents[i]["address"],phone: snapshot.data.documents[i]["phone"],uid: snapshot.data.documents[i]["uid"],type: snapshot.data.documents[i]["type"],desc: snapshot.data.documents[i]["desc"] ,context: this.context,));
                          list.add(lis);
                          print(snapshot.data.documents[i]["name"]);
                      }
                    }
                }
              return ListView(
                children: list,
              );
            }),
      ),
    );
  }


  }




class ListItem extends StatelessWidget {
  String name,address,phone,uid,type,desc;
  BuildContext context;
  ListItem({this.name,this.address,this.phone,this.uid,this.type,this.desc,this.context});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getWidget(),
        ],
      ),
    );
  }
  Widget getWidget(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            right: 16, left: 16, top: 12),
        child: Card(
          shadowColor: Color.fromRGBO(0, 0, 0, 0.75),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NeedyPerson(
                   nm: name,
                    add: address,
                    phn: phone,
                    des: desc,
                    tp: type,
                  ),
                ),
              );
            },
            child: ListTile(

//              onPressed: () {
//                print('hello');
////              Navigator.of(context).push(
////                MaterialPageRoute(
////                  builder: (context) => PDFViewer(
////                    sem: sem,
////                    url: '',
////                    subjectCode: subjectcode,
////                    typeKey: typeKey,
////                    uniqueID: uniqueId,
////                    title: title,
////                  ),
////                ),
////              );
//              },
//            ),
              title: Text(
                type,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                  desc),

            ),
          ),
        ),
      ),
    );
  }
}
