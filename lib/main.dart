import 'dart:collection';

import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
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
        '/': (context) =>  NavigationRoute(),
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
      // body: Column(
      //   children: [
          
      //     ElevatedButton(
      //       child: const Text("to Customer"),
      //       onPressed: () {
      //         Navigator.pushNamed(context, "/customer");
      //       },
      //     ),
      //      ElevatedButton(
      //       child: const Text("To Agent"),
      //       onPressed: (){
      //         Navigator.pushNamed(context, '/agent');
      //       },
      //      ),
      //   ],
      // ),
      body: FlutterMap(
            options: MapOptions(
              center: LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://api.mapbox.com/styles/v1/knight555/ckzxpi6wn00d415p7ai97wesv/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia25pZ2h0NTU1IiwiYSI6ImNrendtcHh0djAwZnEyd3M0OHZ3N3dtanUifQ.2fffqnLOGICTz37Ot15wdw",
                additionalOptions: {
                  'accessToken': "pk.eyJ1Ijoia25pZ2h0NTU1IiwiYSI6ImNrendtcHh0djAwZnEyd3M0OHZ3N3dtanUifQ.2fffqnLOGICTz37Ot15wdw",
                  'id': "mapbox.mapbox-streets-v8",
                },
                attributionBuilder: (_) {
                  return Text("© OpenStreetMap contributors");
                },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(51.5, -0.09),
                    builder: (ctx) =>
                    Container(
                      child: Icon(Icons.home),
                    ),
                  ),
                ],
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




