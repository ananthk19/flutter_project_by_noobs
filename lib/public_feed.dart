import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';

class public_feed extends StatefulWidget {


  @override
  public_feedState createState() => public_feedState();
}

class public_feedState extends State<public_feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
    Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.blueAccent,
    child: StreamBuilder(

    stream: FirebaseFirestore.instance.collection('localMap').snapshots(),
    builder: (context,AsyncSnapshot snapshot){
    if(!snapshot.hasData){
    return const Text("loading");
    }
    else{
    return ListView.builder(
    itemCount: snapshot.data.docs[0]['posts'].length,
    itemBuilder: (context,index){
    var data = snapshot.data.docs[0]['posts'][index];
    return Column(
    children: [
      SizedBox(height: 10,),
    Container(
    width: MediaQuery.of(context).size.width*0.95,
    height: MediaQuery.of(context).size.height*0.56 ,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    decoration: BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(15),

    gradient: LinearGradient(
    colors: [Colors.white.withOpacity(0.7),
    Colors.white.withOpacity(0.6)]
    ,)
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Image.network('https://googleflutter.com/sample_image.jpg',
    height: 300,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,),
    SizedBox(height: 20,),

    Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${data['productName']}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),),
        Text('Posted by ${data['customerName']}',
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),),
      ],
    )
    ),
      SizedBox(height: 10,),
      Container(
        height: 70,
        child: Text('${data['description']}',
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
          icon: Icon(Icons.star_border),
            tooltip: 'Like',
            onPressed: () {  },),
          IconButton(
            icon: Icon(Icons.directions),

            onPressed: () {  },),
          IconButton(
            icon: Icon(Icons.location_on),

            onPressed: () {  },),
          IconButton(
            icon: Icon(Icons.share),

            onPressed: () {  },),

        ],
      ),
    ])

    ),
    SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 30,
    )
    ],
    );

    });
    }
    }
    ),
    ),
    )
    ;
  }
}
