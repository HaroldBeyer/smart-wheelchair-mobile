import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_wheelchair/pages/login.page.dart';
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
              height: 10,
            ),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                 color: Colors.yellow,
                  border: Border.all(
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                "55 (71) 99999-9999",
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.purple),
                    textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Icon(Icons.phone),
              height: 100,
              width: 350,
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => {
                SharedPreferences.getInstance().then((instance) => {
                      instance.remove('user'),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreenPage()))
                    })
              },
            )
          ],
        ),
      ),
    );
  }
}
