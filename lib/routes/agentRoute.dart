import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentRoute extends StatelessWidget {
  const AgentRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ],
          title: const Text("Agent"),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("To LocalMap"),
                onPressed: (){
                  Navigator.pushNamed(context, '/localMap');
                },
              ),
              ElevatedButton(
                child: const Text("To myCommunity"),
                onPressed: (){
                  Navigator.pushNamed(context, '/myCommunity');
                },
              ),
            ],
          ),
        ),
        body:Center(
          child: Text("This is Agent Route"),
        )
    );
  }
}