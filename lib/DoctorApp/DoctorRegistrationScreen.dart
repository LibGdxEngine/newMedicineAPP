import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:protoype_medicine/DoctorApp/DoctorProfilePage.dart';
import 'package:protoype_medicine/Utils/Authentication.dart';

import '../Utils/GradientButton.dart';
import '../Utils/Styles.dart';

class DoctorRegistrationScreen extends StatefulWidget {
  static const String id = 'doctorRegistrationScreen';

  @override
  _DoctorRegistrationScreenState createState() =>
      _DoctorRegistrationScreenState();
}

class _DoctorRegistrationScreenState extends State<DoctorRegistrationScreen> {
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
  AuthImplementation auth;
  final firebaseStore = Firestore.instance;
  @override
  void initState() {
    super.initState();
    auth = new Auth();
    print('here');
  }

  String _Email = "";
  String _password = "";
  String _name = "";
  String _DoctorCode = "";
  String _description = "";
  void validateAndSubmit() async {
    try {
      //if user wants to register >>> make it as register
      String userID = await auth.Signup(_Email, _password);
      _DoctorCode = Random().nextInt(500).toString() + "100";
      print("Registered user ID : " + userID);
      firebaseStore.collection('users').add({
        'userType': 'patient',
        'name': _name,
        'ID': userID,
        'myCode': _DoctorCode,
        'email': _Email,
        'password': _password,
      });
      Navigator.popAndPushNamed(context, DoctorProfilePage.id);
    } catch (e) {
      print("Error >>> : " + e.toString());
      print("Email : " + _Email + " password : " + _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
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
                      textStyle:
                          TextStyle(fontSize: 85.0, fontFamily: "Horizon"),
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.yellow,
                        Colors.blueAccent,
                      ],
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.center // or Alignment.topLeft
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, bottom: 10, top: 50),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _name = value;
                    },
                    decoration: KInputTextDecoration.copyWith(
                        hintText: "Enter your Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, bottom: 10, top: 2),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _Email = value;
                    },
                    decoration: KInputTextDecoration.copyWith(
                        hintText: "Enter your Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, bottom: 2, top: 2),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: KInputTextDecoration.copyWith(
                        hintText: "Enter your password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, bottom: 2, top: 15),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      _description = value;
                    },
                    maxLines: 4,
                    decoration: KInputTextDecorationDoctorDescription.copyWith(
                        hintText: "Tell us about yourself"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 100.0, right: 100.0, top: 50, bottom: 10),
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
                        validateAndSubmit();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
