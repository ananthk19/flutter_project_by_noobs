import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location/flutter_map_location.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class LocalMapRoute extends StatefulWidget {
  const LocalMapRoute({Key? key}) : super(key: key);

  @override
  _LocalMapRouteState createState() => _LocalMapRouteState();
}

class _LocalMapRouteState extends State<LocalMapRoute> {

  List<Marker> allMarkers = [];
  final MapController mapController = MapController();
  var position = null;
  var popupLat = 0.0;
  var popupLong = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("localMap"),
      ),
      body: Stack(children: [
        _loadMap(context),
        _improvisedPopup(context),
      ]),
      
    );;
  }

  Card _improvisedPopup(context) {
    if(popupLong == 0.0 && popupLat == 0.0){
      return Card(
        child: Text('Empty Popup'),
      );
    }
    return Card(
      child: Row(
        children: [
          Text('$popupLat'),
          Text('$popupLong'),
        ],
      ),
    );
  }

  FlutterMap _loadMap(context) {
    _determinePosition();
    setMarkers();
    return
      FlutterMap(
        options: MapOptions(
          plugins: <MapPlugin>[
            // USAGE NOTE 2: Add the plugin
            LocationPlugin(),
          ],
          center: LatLng(9.698890567975168, 76.68551426625142),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/knight555/cl12id9xh001314mcvrhzwkoe/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia25pZ2h0NTU1IiwiYSI6ImNrendtcHh0djAwZnEyd3M0OHZ3N3dtanUifQ.2fffqnLOGICTz37Ot15wdw",
            subdomains: ['a', 'b', 'c']

          ),
          MarkerLayerOptions(
            markers: allMarkers,
          ),
        ],
      );
  }

  Future<void> _determinePosition() async {
    // print('This is determinePosition');
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print(Future.error('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        print(Future.error('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print(Future.error('Location permissions are permanently denied, we cannot request permissions.'));
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var pos =  await Geolocator.getCurrentPosition();
    setState((){
      position = pos;
      // print(position.latitude);
      // print(position.longitude);
    });
  }


  setMarkers() {
    List<Marker> _allMarkers = [];
    _allMarkers.add(
      Marker(
        width: 50.0,
        height: 50.0,
        point: LatLng(position.latitude, position.longitude), 
        builder: (ctx) => 
          Container(
            child: Icon(Icons.person_pin_rounded)
          ),
      ),
    );

    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("localMap").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        for( int i = 0; i < result.data()['posts'].length; i++ ){
          _allMarkers.add(
              Marker(
                width: 50.0,
                height: 50.0,
                point: LatLng(result.data()['posts'][i]['coordinates'].latitude, result.data()['posts'][i]['coordinates'].longitude),
                builder: (ctx) =>
                    Container(
                      child: IconButton(
                        iconSize: 50,
                        color: Colors.green[300],
                        icon: Icon(Icons.location_on_sharp),
                          onPressed: (){
                            toggleCard([result.data()['posts'][i]['coordinates'].latitude,result.data()['posts'][i]['coordinates'].longitude]);
                          }
                      ),
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

  toggleCard(coords) {
    // print(coords);
    setState(() {
      popupLat = coords[0];
      popupLong = coords[1];
    });
  }
}

