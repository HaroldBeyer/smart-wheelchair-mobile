import 'package:flutter/material.dart';
import 'package:smart_wheelchair/widgets/bottomNavigationBar.widget.dart';

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(pos: 2,),
      backgroundColor: Colors.purple,
      body: Container(),
    );
  }
}
