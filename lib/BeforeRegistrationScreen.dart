import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:protoype_medicine/DoctorApp/DoctorRegistrationScreen.dart';
import 'package:protoype_medicine/PatientApp/RegisterationSceen.dart';

import 'Utils/GradientButton.dart';

class BeforeRegisterationScreen extends StatefulWidget {
  static const String id = 'beforeRegisterationPage';
  @override
  _BeforeRegisterationScreenState createState() =>
      _BeforeRegisterationScreenState();
}

category choice = category.non;
enum category { non, doctor, patient }

class _BeforeRegisterationScreenState extends State<BeforeRegisterationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          choice = category.patient;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: choice == category.patient
                              ? Border.all(color: Colors.blue, width: 3)
                              : Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/patient.png',
                              width: 100,
                              height: 100,
                            ),
                            Text(
                              'I\'am a Patient',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          choice = category.doctor;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: choice == category.doctor
                              ? Border.all(color: Colors.blue, width: 3)
                              : Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/doctor2.png',
                              width: 100,
                              height: 100,
                            ),
                            Text(
                              'I\'am a Doctor',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 100.0, right: 100.0, top: 50),
                child: RaisedGradientButton(
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[Colors.white, Colors.blueAccent],
                    ),
                    onPressed: () {
                      if (choice == category.patient) {
                        Navigator.pushNamed(
                          context,
                          RegistrationScreen.id,
                        );
                      } else if (choice == category.doctor) {
                        Navigator.pushNamed(
                          context,
                          DoctorRegistrationScreen.id,
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
