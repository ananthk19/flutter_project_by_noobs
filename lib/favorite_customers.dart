import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_project_by_noobs/fav_customer_posts.dart';

class favorite_customers extends StatefulWidget {
  const favorite_customers({Key? key}) : super(key: key);

  @override
  _favorite_customersState createState() => _favorite_customersState();
}

class _favorite_customersState extends State<favorite_customers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Customers'),
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
        color: Colors.black,
          fontWeight: FontWeight.bold,
      ),),
      body: Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,

    child: StreamBuilder(

    stream: FirebaseFirestore.instance.collection('agent').doc('sRw2MTzyTbm9ROL087kT').snapshots(),
    builder: (context,AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return const Text("loading");
      }
      else {
        return ListView.builder(
          itemCount: snapshot.data['taggedCustomers'].length,
          itemBuilder: (context,index){

            var data = snapshot.data['taggedCustomers'][index];

           return Container(
             decoration: const BoxDecoration(
               shape: BoxShape.rectangle,
               color: Colors.white38,
             ),
             width: MediaQuery.of(context).size.width,
             height: 50,
             padding: EdgeInsets.all(10),
             child: Row(

               children: [
                 Container(
                   width: 50,
                   height: 40,
                   decoration: const BoxDecoration(
                     shape: BoxShape.circle,
                   ),
                   child: Icon(Icons.account_circle_rounded),
                 ),
                 Container(
                   padding: const EdgeInsets.only(top: 7.5),
                   width: MediaQuery.of(context).size.width*0.5,
                   height: 40,
                   child: Text('${data['customerName']}',
                     style: const TextStyle(
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 TextButton(onPressed: (){
                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>fav_customer_posts()));
                 },
                     child: const Text('Posts',
                     style: TextStyle(color: Colors.blue),),
                 ),
                 IconButton(onPressed: (){}, icon: const Icon(Icons.currency_rupee,
                 size: 19,)),

               ],
             )
           );


          },
        );
      }
    }
      ))
    );
  }
}
