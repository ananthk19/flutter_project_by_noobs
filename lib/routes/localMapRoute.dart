import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class LocalMapRoute extends StatefulWidget {
  const LocalMapRoute({Key? key}) : super(key: key);

  @override
  _LocalMapRouteState createState() => _LocalMapRouteState();
}

class _LocalMapRouteState extends State<LocalMapRoute> {

  List<Marker> allMarkers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _loadMap(context),
    );;
  }

  FlutterMap _loadMap(context) {
    setMarkers();
    return
      FlutterMap(
        options: MapOptions(
          center: LatLng(9.698890567975168, 76.68551426625142),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/knight555/ckzxpi6wn00d415p7ai97wesv/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia25pZ2h0NTU1IiwiYSI6ImNrendtcHh0djAwZnEyd3M0OHZ3N3dtanUifQ.2fffqnLOGICTz37Ot15wdw",

          ),
          MarkerLayerOptions(
            markers: allMarkers,
          ),
        ],
      );
  }

  setMarkers() {
    List<Marker> _allMarkers = [];

    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("localMap").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        for( int i = 0; i < result.data()['posts'].length; i++ ){
          _allMarkers.add(
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(result.data()['posts'][i]['coordinates'].latitude, result.data()['posts'][i]['coordinates'].longitude),
                builder: (ctx) =>
                    Container(
                      child: IconButton(
                        iconSize: 50,
                        color: Colors.blueAccent,
                        icon: Icon(Icons.priority_high_rounded),
                          onPressed: (){
                            print('Test Description');
                          }
                      ),
                      // child: Icon(Icons.add_location),
                    ),
              )
          );
        }
        setState(() {
          allMarkers = _allMarkers;
        });
      }
      );
    }
    );
  }
}

