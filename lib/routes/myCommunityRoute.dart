import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCommunityRoute extends StatelessWidget {
  const MyCommunityRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("myCommunity"),
        ),
        body:Center(
          child: Text("This is myCommunity Route"),
        )
    );
  }
}