import 'package:firebase_database/firebase_database.dart';
import 'package:latlong/latlong.dart';

class Occurence {
  String day;
  String hour;
  LatLng location;

  Occurence.fromSnapshot(DataSnapshot snapshot)
      : day = snapshot.value['day'],
        hour = snapshot.value['hour'],
        location = snapshot.value['location'];

  Occurence({this.day, this.hour, this.location});

  toJson() {
    return {"day": day, "hour": hour, "location": location};
  }
}
