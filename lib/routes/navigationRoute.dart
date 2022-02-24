import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationRoute extends StatelessWidget {
  const NavigationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("to Customer"),
              onPressed: () {
                Navigator.pushNamed(context, "/customer");
              },
            ),
            ElevatedButton(
              child: const Text("To Agent"),
              onPressed: (){
                Navigator.pushNamed(context, '/agent');
              },
            ),
          ],
        ),
      ),
    );
  }
}