import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_wheelchair/pages/latest_occurence.page.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Text("Última ocorrência"),
          icon: IconButton(
            icon: Icon(Icons.zoom_out_map_sharp),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LatestOccurencePage()))
            },
          ),
        ),
        BottomNavigationBarItem(
            title: Text("Ocorrências"), icon: Icon(Icons.map)),
        BottomNavigationBarItem(
            title: Text("Médico"), icon: Icon(Icons.healing))
      ],
    );
  }
}
