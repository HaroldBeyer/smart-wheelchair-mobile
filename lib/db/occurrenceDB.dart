import 'package:firebase_database/firebase_database.dart';

class OccurenceDB {
  Future getLatestOccurence(String uid) async {
    DataSnapshot ref = await (FirebaseDatabase.instance
        .reference()
        .child('occurences')
        .child(uid)
        .limitToLast(1)).once();
    return ref.value;
  }

  Future getAllOccurences(String uid) async {
    var ref = await
        (FirebaseDatabase.instance.reference().child('occurences').child(uid)).once();
    return ref.value;
  }
}
