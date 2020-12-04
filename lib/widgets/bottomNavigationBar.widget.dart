import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_wheelchair/pages/doctor.page.dart';
import 'package:smart_wheelchair/pages/latest_occurence.page.dart';

class CustomNavigationBar extends StatelessWidget {
  int pos;
  CustomNavigationBar({this.pos});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: this.pos == 0 ?  [
        lastOccurrenceBarItem(context),
        occurrencesBarItem(),
        doctorBarItem(context)
      ] : this.pos == 1 ?
       [
         occurrencesBarItem(),
        doctorBarItem(context), 
        lastOccurrenceBarItem(context)
        ]
        : 
       [ 
         doctorBarItem(context),
          lastOccurrenceBarItem(context), 
          occurrencesBarItem()
          ],
    );

  }

  BottomNavigationBarItem doctorBarItem(BuildContext context) {
    return BottomNavigationBarItem(
        title: Text("Médico"),
        icon: IconButton(
          icon: Icon(Icons.healing),
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DoctorPage()))
          },
        ));
  }

  BottomNavigationBarItem occurrencesBarItem() {
    return BottomNavigationBarItem(
        title: Text("Ocorrências"), icon: Icon(Icons.map));
  }

  BottomNavigationBarItem lastOccurrenceBarItem(BuildContext context) {
    return BottomNavigationBarItem(
      title: Text("Última ocorrência"),
      icon: IconButton(
        icon: Icon(Icons.zoom_out_map_sharp),
        onPressed: () => {
          print("Pressed!"),
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LatestOccurencePage()))
        },
      ),
    );
  }
}
