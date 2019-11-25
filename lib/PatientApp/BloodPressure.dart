import 'package:flutter/material.dart';
import 'package:protoype_medicine/PatientApp/BloodPressureSymptoms.dart';
import 'package:protoype_medicine/PatientApp/BloodPressureTreatments.dart';

class BloodPressure extends StatefulWidget {
  static String id = 'bloodpressure';
  @override
  _BloodPressureState createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
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
                'images/__.jpeg',
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(45.0),
                child: Text(
                  'Blood Pressure',
                  style: TextStyle(fontSize: 45, color: Colors.blue),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //Go to symptoms page
                  Navigator.pushNamed(context, BloodPressureSymptoms.id);
                },
                child: Card(
                  elevation: 5,
                  color: Colors.blueAccent,
                  child: Container(
                    width: 120,
                    height: 75,
                    child: Center(
                      child: Text(
                        'Symptoms',
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
                  Navigator.pushNamed(context, BloodPressureTreatment.id);
                },
                child: Card(
                  elevation: 5,
                  color: Colors.blueAccent,
                  child: Container(
                    width: 120,
                    height: 75,
                    child: Center(
                      child: Text(
                        'Treatment',
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
