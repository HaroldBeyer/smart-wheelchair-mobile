import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class LatestOccurence extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text("Ocorrências"), icon: Icon(Icons.map)),
            BottomNavigationBarItem(
                title: Text("Última ocorrência"),
                icon: Icon(Icons.zoom_out_map_sharp)),
            BottomNavigationBarItem(
                title: Text("Médico"), icon: Icon(Icons.healing))
          ],
        ),
        body: Container(
            child: FlutterMap(
          options: new MapOptions(
            center: new LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: new LatLng(51.5, -0.09),
                  builder: (ctx) => new Container(
                    child: new FlutterLogo(),
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
