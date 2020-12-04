import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_wheelchair/db/occurrenceDB.dart';
import 'package:smart_wheelchair/models/occurrence.dart';
import 'package:smart_wheelchair/widgets/bottomNavigationBar.widget.dart';
import 'package:smart_wheelchair/widgets/occurence.widget.dart';

class OccurencesPage extends StatefulWidget {
  @override
  _OccurencesPageState createState() => _OccurencesPageState();
}

class _OccurencesPageState extends State<OccurencesPage> {
  LatLng position;

  List<Occurence> occurencesList;

  OccurenceDB occurenceDB = new OccurenceDB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadOccurences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        pos: 1,
      ),
      body: Container(
        child: position != null
            ? FlutterMap(
                options: MapOptions(
                  center: this.position,
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(markers: makeMarkersArray(context))
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
              ),
      ),
    );
  }

  void loadOccurences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String uid = sp.getString('user');
    LatLng lastLocation;
    List<Occurence> list = new List<Occurence>();

    var res = await occurenceDB.getAllOccurences(uid);
    var keys = res.keys;

    for (var key in keys) {
      var hour = res[key]['hour'];
      var ln = res[key]['location']['ln'].toDouble();
      var lt = res[key]['location']['lt'].toDouble();
      var location = new LatLng(lt, ln);
      var day = res[key]['day'];
      Occurence occurence =
          new Occurence(day: day, location: location, hour: hour);
      list.add(occurence);
      //always the last one
      lastLocation = location;
    }

    setState(() {
      this.occurencesList = list;
      this.position = lastLocation;
    });
  }

  List<Marker> makeMarkersArray(BuildContext context) {
    List<Marker> list = new List<Marker>();

    for (var occurence in occurencesList) {
      LatLng latLng = occurence.location;
      Marker marker = new Marker(
        width: 80.0,
        height: 80.0,
        point: latLng,
        builder: (ctx) => new Container(
          child: IconButton(
              icon: Icon(Icons.place),
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => OccurenceWidget(
                      occurence: occurence,
                      onClosedOccurence: () => Navigator.pop(context)))),
        ),
      );
      list.add(marker);
    }
    return list;
  }
}
