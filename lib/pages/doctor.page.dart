import 'package:flutter/material.dart';
import 'package:smart_wheelchair/widgets/bottomNavigationBar.widget.dart';

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        pos: 2,
      ),
      backgroundColor: Colors.purple,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/images/doctor.png',
              height: 200,
              width: 200,
              alignment: Alignment.topCenter,
              // alignment: Alignment.center,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                "55 (71) 99999-9999",
                style: TextStyle(fontSize: 24, backgroundColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Icon(Icons.phone),
              height: 150,
              width: 350,
            ),
          ],
        ),
      ),
    );
  }
}
