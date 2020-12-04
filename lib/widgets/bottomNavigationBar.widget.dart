import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_wheelchair/pages/doctor.page.dart';
import 'package:smart_wheelchair/pages/latest_occurence.page.dart';
import 'package:smart_wheelchair/pages/login.page.dart';
import 'package:smart_wheelchair/pages/occurrences.page.dart';

class CustomNavigationBar extends StatelessWidget {
  int pos;
  CustomNavigationBar({this.pos});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: this.pos == 0
          ? [
              lastOccurrenceBarItem(context),
              occurrencesBarItem(context),
              doctorBarItem(context),
            ]
          : this.pos == 1
              ? [
                  occurrencesBarItem(context),
                  doctorBarItem(context),
                  lastOccurrenceBarItem(context)
                ]
              : [
                  doctorBarItem(context),
                  lastOccurrenceBarItem(context),
                  occurrencesBarItem(context)
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

  BottomNavigationBarItem occurrencesBarItem(BuildContext context) {
    return BottomNavigationBarItem(
      title: Text("Ocorrências"),
      icon: IconButton(
          icon: Icon(Icons.map),
          onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OccurencesPage()))
              }),
    );
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

    BottomNavigationBarItem logout(BuildContext context) {
    return BottomNavigationBarItem(
      title: Text("Logout"),
      icon: IconButton(
        icon: Icon(Icons.logout),
        onPressed: () => {
    SharedPreferences.getInstance().then((instance) => {
              
              instance.remove('user'),
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreenPage()))
            
              }),
        },
      ),
    );
  }
}
