import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_wheelchair/models/occurrence.dart';

class OccurenceWidget extends StatelessWidget {
  Occurence occurence;
  OccurenceWidget({this.occurence, this.onClosedOccurence});
  VoidCallback onClosedOccurence;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        Icon(Icons.timer),
        Text(
          this.occurence.hour,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          this.occurence.day,
          style: TextStyle(fontSize: 12),
        ),
        ListTile(
          title: Text("Fechar"),
          onTap: onClosedOccurence,
        )
      ],
      title: Text(this.occurence.day),
    );
  }
}
