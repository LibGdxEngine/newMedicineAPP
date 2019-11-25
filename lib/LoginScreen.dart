import 'dart:collection';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protoype_medicine/DoctorApp/DoctorProfilePage.dart';
import 'package:protoype_medicine/Models/Doctor.dart';
import 'package:protoype_medicine/Models/Patient.dart';
import 'package:protoype_medicine/PatientApp/MainScreen.dart';
import 'package:protoype_medicine/Utils/Authentication.dart';

import 'Models/User.dart';
import 'Utils/GradientButton.dart';
import 'Utils/Styles.dart';

AuthImplementation auth;
String _email = "";
String _password = "";
enum userType { doctor, patient }

class LoginScreen extends StatefulWidget {
  static const String id = 'loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  userType typeOfUser = userType.patient;
  void validateAndLogin() async {
    try {
      var UID = await auth.Signin(_email, _password);
      print('uis is : $UID');
      if (typeOfUser == userType.patient) {
        Navigator.pushNamed(context, MainScreen.id);
      } else if (typeOfUser == userType.doctor) {
        Navigator.pushNamed(context, DoctorProfilePage.id);
      } else {
        print("Error can't know the user Type !");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<User>> _getListFromFirestore(String collection) async {
    CollectionReference ref = Firestore.instance.collection(collection);
    QuerySnapshot eventsQuery = await ref.getDocuments();

    HashMap<String, User> eventsHashMap = new HashMap<String, User>();
    eventsQuery.documents.forEach((document) {
      print("data " + document.data.toString());
      print("inData " + document['ID']);
      eventsHashMap.putIfAbsent(
        document['ID'],
        () => document['userType'].toString().contains('patient')
            ? Patient(
                document['name'],
                document['sex'],
                document['age'],
                document['ID'],
                document['doctorCode'],
                document['email'],
                document['password'],
              )
            : Doctor(),
      );
    });

    return eventsHashMap.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: screen_width,
            child: ColorizeAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "Health",
                ],
                textStyle: TextStyle(fontSize: 85.0, fontFamily: "Horizon"),
                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.blueAccent,
                ],
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.center // or Alignment.topLeft
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, bottom: 10, top: 100),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                _email = value;
              },
              onSubmitted: (value) {
                _email = value;
              },
              decoration:
                  KInputTextDecoration.copyWith(hintText: "Enter your name"),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25.0, right: 25, bottom: 2, top: 2),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {
                _password = value;
              },
              onSubmitted: (value) {
                _password = value;
              },
              decoration: KInputTextDecoration.copyWith(
                  hintText: "Enter your password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 100.0, right: 100.0, top: 50, bottom: 10),
            child: RaisedGradientButton(
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                gradient: LinearGradient(
                  colors: <Color>[Colors.white, Colors.blueAccent],
                ),
                onPressed: () {
                  Future<List<User>> users = _getListFromFirestore('users');
                  checkUserType(users);
                  validateAndLogin();

//                        Navigator.pushNamed(context, MainScreen.id);
                }),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    auth = new Auth();
    Future<List<User>> users = _getListFromFirestore('users');
    checkUserType(users);
    validateAndLogin();
  }

  void checkUserType(Future<List<User>> users) async {
    for (User i in await users) {
      print("UID IS  " + i.pID);
      if (i.pID == "patient") {
        typeOfUser = userType.patient;
        print("user is patient");
      } else {
        typeOfUser = userType.doctor;
        print("user is doctor");
      }
    }
  }
}
