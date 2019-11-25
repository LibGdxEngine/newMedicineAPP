import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  static const String id = 'doctorprofilepage';
  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Doctor profile'),
        ),
        body: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
