import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_by_noobs/customer_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'flutter_project_by_noobs',
      initialRoute: '/',
      routes: {
        '/': (context) =>  customer_login(),
        '/customer': (context) => const CustomerRoute(),
        '/myAgents': (context) => const MyAgentsRoute(),
        '/agent': (context) => const AgentRoute(),
        '/localMap': (context) => const LocalMapRoute(),
        '/myCommunity': (context) => const MyCommunityRoute(),
      },
    ),
  );
}


class NavigationRoute extends StatelessWidget {
  const NavigationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      body: Column(
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
          ElevatedButton(
            child: const Text("Test"),
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }
}

class CustomerRoute extends StatelessWidget {
  const CustomerRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text("To MyAgents"),
            onPressed: (){
              Navigator.pushNamed(context, '/myAgents');
            },
           ),
        ],
      ),
    );
  }
}

class MyAgentsRoute extends StatelessWidget {
  const MyAgentsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyAgents"),
      ),
      body: Column(
        children: [
          Center(child: const Text("MyAgents"),)
        ],
      ),
    );
  }
}

class AgentRoute extends StatelessWidget {
  const AgentRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agent"),
      ),
      body: Column(
        children: [
           ElevatedButton(
            child: const Text("To LocalMap"),
            onPressed: (){
              Navigator.pushNamed(context, '/localMap');
            },
           ),
           ElevatedButton(
            child: const Text("To MyCommunity"),
            onPressed: (){
              Navigator.pushNamed(context, '/myCommunity');
            },
           ),
        ],
      ),
    );
  }
}


class LocalMapRoute extends StatelessWidget {
  const LocalMapRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LocalMap"),
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}

class MyCommunityRoute extends StatelessWidget {
  const MyCommunityRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyCommunity"),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}




