import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_wheelchair/pages/login.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          throw new Error();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Smart Wheelchair',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            home: LoginScreenPage(),
            debugShowCheckedModeBanner: false,
          );
        }
      },
    );
  }
}
