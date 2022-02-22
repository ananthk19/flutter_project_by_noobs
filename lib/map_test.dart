import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class map_test extends StatefulWidget {
  const map_test({Key? key}) : super(key: key);

  @override
  _map_testState createState() => _map_testState();
}

class _map_testState extends State<map_test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
      ),
    body: FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.mapbox.com/styles/v1/nani1618/ckzy7ra3p000k14o6yepicg0y/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibmFuaTE2MTgiLCJhIjoiY2t6eTZ3YzRnMDdxbzJ3cDlwYzJ5enF3byJ9.zWDgeCO6rNVifLjv6Wgm6w",

          additionalOptions: {
            'accesstoken':'pk.eyJ1IjoibmFuaTE2MTgiLCJhIjoiY2t6eTcyNDg2MDJrNDJubWxoemRsbDMzMyJ9.8MpBN1Vi5BIpPsjQM6rXMQ',
            'id':'mapbox.mapbox-streets-v8'
          }
        ),
        /*MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) =>
                  Container(
                    child: FlutterLogo(),
                  ),
            ),
          ],
        ),*/
      ],
    ),
    );
  }
}
