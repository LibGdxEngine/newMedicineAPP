import 'package:flutter/material.dart';
import 'package:protoype_medicine/BeforeRegistrationScreen.dart';
import 'package:protoype_medicine/DoctorApp/DoctorProfilePage.dart';
import 'package:protoype_medicine/DoctorApp/DoctorRegistrationScreen.dart';
import 'package:protoype_medicine/Map.dart';
import 'package:protoype_medicine/PatientApp/BloodPressure.dart';
import 'package:protoype_medicine/PatientApp/BloodPressureSymptoms.dart';
import 'package:protoype_medicine/PatientApp/BloodPressureTreatments.dart';
import 'package:protoype_medicine/PatientApp/Complications.dart';
import 'package:protoype_medicine/PatientApp/ComplicationsEyePressure.dart';
import 'package:protoype_medicine/PatientApp/ComplicationsHeartAttack.dart';
import 'package:protoype_medicine/PatientApp/DiabetesType2.dart';
import 'package:protoype_medicine/PatientApp/MainScreen.dart';
import 'package:protoype_medicine/PatientApp/Measurements.dart';
import 'package:protoype_medicine/PatientApp/MyDoctorScreen.dart';
import 'package:protoype_medicine/PatientApp/NormalScreen.dart';
import 'package:protoype_medicine/PatientApp/RecordsScreen.dart';
import 'package:protoype_medicine/PatientApp/RegisterationSceen.dart';

import 'LoginScreen.dart';
import 'WelcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        DiabetesType2.id: (context) => DiabetesType2(),
        Complications.id: (context) => Complications(),
        ComplicationsHeartAttack.id: (context) => ComplicationsHeartAttack(),
        ComplicationsEyePressure.id: (context) => ComplicationsEyePressure(),
        BloodPressureSymptoms.id: (context) => BloodPressureSymptoms(),
        BloodPressureTreatment.id: (context) => BloodPressureTreatment(),
        BloodPressure.id: (context) => BloodPressure(),
        MapPage.id: (context) => MapPage(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        BeforeRegisterationScreen.id: (context) => BeforeRegisterationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DoctorRegistrationScreen.id: (context) => DoctorRegistrationScreen(),
        MainScreen.id: (context) => MainScreen(),
        Measurements.id: (context) => Measurements(),
        DoctorProfilePage.id: (context) => DoctorProfilePage(),
        Records.id: (context) => Records(),
        DoctorScreen.id: (context) => DoctorScreen(),
        NormalScreen.id: (context) => NormalScreen(),
      },
    );
  }
}
