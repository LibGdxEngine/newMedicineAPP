import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protoype_medicine/PatientApp/Complications.dart';
import 'package:protoype_medicine/PatientApp/DiabetesType2.dart';
import 'package:protoype_medicine/PatientApp/Measurements.dart';
import 'package:protoype_medicine/PatientApp/MyDoctorScreen.dart';
import 'package:protoype_medicine/PatientApp/RecordsScreen.dart';

import 'BloodPressure.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'mainscreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser _firebaseUser;

  Future getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        _firebaseUser = user;
      }
    } catch (e) {
      print(e);
    }
    print("user email : " + _firebaseUser.email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          primary: false,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.exit_to_app),
              ),
            ),
          ],
          title: Text('Health care app'),
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: buildCard('images/bag.png', 'measurement', () {
                      Navigator.pushNamed(context, Measurements.id);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCard('images/doctor.png', 'Doctors', () {
                      Navigator.pushNamed(context, DoctorScreen.id);
                    }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCard('images/patient.png', 'Records', () {
                      Navigator.pushNamed(context, Records.id);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCard('images/_.png', 'Complications', () {
                      Navigator.pushNamed(context, Complications.id);
                    }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCard('images/image1.png', 'Blood Pressure', () {
                      Navigator.pushNamed(context, BloodPressure.id);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        buildCard('images/hosbital.png', 'Diabetes type 2', () {
                      Navigator.pushNamed(context, DiabetesType2.id);
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(String image, String text, Function onPress) {
    return Card(
      color: Colors.white,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: 120,
          height: 150,
          child: Column(
            children: <Widget>[
              Image.asset(
                image,
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
}
