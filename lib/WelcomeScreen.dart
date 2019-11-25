import 'dart:collection';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:protoype_medicine/BeforeRegistrationScreen.dart';
import 'package:protoype_medicine/DoctorApp/DoctorProfilePage.dart';
import 'package:protoype_medicine/LoginScreen.dart';
import 'package:protoype_medicine/PatientApp/MainScreen.dart';

import 'Models/User.dart';
import 'Utils/Authentication.dart';
import 'Utils/GradientButton.dart';

enum AuthStatus { notSignedIn, signedIn }
enum userType { patient, doctor }
final Firestore firestore = Firestore.instance;
AuthImplementation auth;

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcomescreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState(id);
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;
  userType type = userType.patient;
  String id;

  _WelcomeScreenState(this.id);

  @override
  Widget build(BuildContext context) {
//    auth.Signout();
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return WelcomScreenContent(screen_width, context);
      case AuthStatus.signedIn:
        getUserType('');
    }

    return WelcomScreenContent(screen_width, context);
  }

  SafeArea WelcomScreenContent(double screen_width, BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: screen_width,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              image: AssetImage("images/_.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(width: 20.0, height: 100.0),
                    Text(
                      "Be",
                      style: TextStyle(fontSize: 43.0, color: Colors.white),
                    ),
                    SizedBox(width: 20.0, height: 100.0),
                    RotateAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        text: [" HEALTHY", "OPTIMISTIC", "HAPPY"],
                        textStyle: TextStyle(
                            fontSize: 40.0,
                            fontFamily: "Horizon",
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                        ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: RaisedGradientButton(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[Colors.white, Colors.blueAccent],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: RaisedGradientButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[Colors.white, Colors.blueAccent],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, BeforeRegisterationScreen.id);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    auth = new Auth();
    auth.getCurrentUser().then((firebaseUserID) {
      setState(() {
        _authStatus = firebaseUserID == null
            ? AuthStatus.notSignedIn
            : AuthStatus.signedIn;

        print('uid is ' + firebaseUserID.toString());
      });
    });
  }

  void getUserType(String uid) async {
    CollectionReference ref = Firestore.instance.collection('users');
    QuerySnapshot eventsQuery = await ref.getDocuments();
    HashMap<String, User> eventsHashMap = new HashMap<String, User>();
    eventsQuery.documents.forEach((document) {
      if (document['ID'] == uid) {
        type = document['userType'] == 'patient'
            ? userType.patient
            : userType.doctor;
      }
    });
    print('user type is ' + type.toString());
    if (type == userType.patient && id == 'welcomescreen') {
      Navigator.pushReplacementNamed(context, MainScreen.id);
    } else {
      Navigator.pushReplacementNamed(context, DoctorProfilePage.id);
    }
  }
}
