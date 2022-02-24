import 'package:flutter_project_by_noobs/routes/navigationRoute.dart';
import 'package:flutter_project_by_noobs/routes/customerRoute.dart';
import 'package:flutter_project_by_noobs/routes/localMapRoute.dart';
import 'package:flutter_project_by_noobs/routes/myAgentsRoute.dart';
import 'package:flutter_project_by_noobs/routes/myCommunityRoute.dart';
import 'package:flutter_project_by_noobs/routes/agentRoute.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'flutter_project_by_noobs',
      initialRoute: '/',
      routes: {
        '/': (context) =>  NavigationRoute(),
        '/customer': (context) => CustomerRoute(),
        '/myAgents': (context) => MyAgentsRoute(),
        '/agent': (context) => AgentRoute(),
        '/localMap': (context) => LocalMapRoute(),
        '/myCommunity': (context) => MyCommunityRoute(),
      },
    ),
  );
}





