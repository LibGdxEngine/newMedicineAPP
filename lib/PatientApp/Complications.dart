import 'package:flutter/material.dart';
import 'package:protoype_medicine/PatientApp/ComplicationsEyePressure.dart';
import 'package:protoype_medicine/PatientApp/ComplicationsHeartAttack.dart';

class Complications extends StatefulWidget {
  static String id = 'complications';
  @override
  _Complications createState() => _Complications();
}

class _Complications extends State<Complications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/heart_attack.png',
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(
                  'Diabetes Complications',
                  style: TextStyle(fontSize: 45, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  //Go to heart attack page
                  Navigator.pushNamed(context, ComplicationsHeartAttack.id);
                },
                child: Card(
                  elevation: 5,
                  color: Colors.blueAccent,
                  child: Container(
                    width: 120,
                    height: 75,
                    child: Center(
                      child: Text(
                        'Heart attack',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  //Go to treatment page
                  Navigator.pushNamed(context, ComplicationsEyePressure.id);
                },
                child: Card(
                  elevation: 5,
                  color: Colors.blueAccent,
                  child: Container(
                    width: 120,
                    height: 75,
                    child: Center(
                      child: Text(
                        'Eye pressure',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
