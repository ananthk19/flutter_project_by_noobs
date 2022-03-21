import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_by_noobs/routes/localMapRoute.dart';
import 'package:flutter_project_by_noobs/customer_registration_form.dart';
import 'package:flutter_project_by_noobs/favorite_customers.dart';
import 'package:flutter_project_by_noobs/public_feed.dart';



class myCommunityRoute extends StatefulWidget {
  const myCommunityRoute({Key? key}) : super(key: key);

  @override
  _myCommunityRouteState createState() => _myCommunityRouteState();
}

class _myCommunityRouteState extends State<myCommunityRoute> {
      int index = 0;
      Widget screen = public_feed();
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: true,
          appBar: AppBar(
            title: Text('My Community'),
          ),
            drawer: Drawer(),
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Colors.blue,
              index: index,
              buttonBackgroundColor: Colors.white,
              animationCurve: Curves.linear,
              animationDuration: Duration(milliseconds: 300),
              items: const <Widget>[
                Icon(Icons.home, size: 25),
                Icon(Icons.location_on, size: 25),
                Icon(Icons.star, size: 25),
                Icon(Icons.account_circle,size: 25,),
              ],
              onTap: (index) => setState(() {


                if(index ==0) {
                 screen = public_feed();
                }
                if(index==2){
                  screen = favorite_customers();
                }
                if(index==1){
                  screen = LocalMapRoute();
                }
                if(index==3){
                  screen = customer_registration_form();
                }
        })
            ),
        body: screen,
        );
      }


}
class Posts{
  String? customerName;
  String? customerId;
  String? description;
  String? image;
  String? coordinates;
Posts();
Posts.fromSnapshot(snapshot){
  customerName = snapshot.data()['customerName'];
  customerId = snapshot.data()['customerId'];
  description = snapshot.data()['description'];
  image = snapshot.data()['image'];
  coordinates = snapshot.data()['coordinates'];
}


}
