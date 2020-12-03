import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_wheelchair/db/occurrenceDB.dart';
import 'package:smart_wheelchair/models/occurrence.dart';
import 'package:smart_wheelchair/widgets/occurence.widget.dart';

class LatestOccurence extends StatefulWidget {
  @override
  _LatestOccurenceState createState() => _LatestOccurenceState();
}

class _LatestOccurenceState extends State<LatestOccurence> {
  OccurenceDB occurenceDB = new OccurenceDB();

/**starts with a defined value */
  LatLng location;
  Occurence occurence;

  @override
  void initState() {
    super.initState();
    loadLatestOccurence();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text("Última ocorrência"),
                icon: Icon(Icons.zoom_out_map_sharp)),
            BottomNavigationBarItem(
                title: Text("Ocorrências"), icon: Icon(Icons.map)),
            BottomNavigationBarItem(
                title: Text("Médico"), icon: Icon(Icons.healing))
          ],
        ),
        body: Container(
            child: location != null
                ? FlutterMap(
                    options: MapOptions(
                      center: this.location,
                      zoom: 13.0,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: this.location,
                            builder: (ctx) => new Container(
                              child: IconButton(
                                  icon: Icon(Icons.place),
                                  onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          OccurenceWidget(
                                              occurence: this.occurence,
                                              onClosedOccurence: () =>
                                                  Navigator.pop(context)))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Dialog(
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        new CircularProgressIndicator(),
                        new Text("Loading"),
                      ],
                    ),
                  )));
  }

  void loadLatestOccurence() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String uid = sp.getString('user');
    String hour;
    LatLng location;
    String day;
    var res = await occurenceDB.getLatestOccurence(uid);
    var keys = res.keys;

    for (var key in keys) {
      hour = res[key]['hour'];
      var ln = res[key]['location']['ln'].toDouble();
      var lt = res[key]['location']['lt'].toDouble();
      location = new LatLng(lt, ln);
      day = res[key]['day'];
    }
    setState(() {
      this.occurence = new Occurence(location: location, day: day, hour: hour);
      this.location = location;
    });
  }
}
