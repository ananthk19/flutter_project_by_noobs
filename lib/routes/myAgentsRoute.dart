import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAgentsRoute extends StatelessWidget {
  const MyAgentsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // actions: <Widget>[
          //   IconButton(
          //     onPressed: (){
          //       Navigator.pop(context);
          //     },
          //     icon: Icon(Icons.arrow_back),
          //   ),
          // ],
          title: const Text("myAgents"),
        ),
        body:Center(
          child: Text("This is myAgents Route"),
        )
    );
  }
}