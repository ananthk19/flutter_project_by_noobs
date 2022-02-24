import 'package:flutter/material.dart';

class CustomerRoute extends StatelessWidget {
  const CustomerRoute({Key? key}) : super(key: key);

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
        title: const Text("Customer"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("To MyAgents"),
                onPressed: (){
                  Navigator.pushNamed(context, '/myAgents');
                },
              ),
            ],
          ),
        ),
      body:Center(
        child: Text("This is Customer Route"),
      )
    );
  }
}
