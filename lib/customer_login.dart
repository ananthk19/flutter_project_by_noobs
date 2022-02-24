import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class customer_login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Customer_signIn();
  }

}

class Customer_signIn extends State<customer_login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Customer Login"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Stack(
              children:<Widget> [
                Container(
                  width: 300,
                  height: 250 ,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,

                  ),
                )
              ],

            )
          ],
        ),
      )
    );
  }
  
}

