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
        SizedBox(height: 20,),
        Icon(Icons.timer),
        Text(
          this.occurence.hour,
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10,),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: onClosedOccurence,
        )
      ],
      title: Text(this.occurence.day, textAlign: TextAlign.center),
    );
  }
}
