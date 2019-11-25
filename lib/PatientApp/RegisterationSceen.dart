import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protoype_medicine/PatientApp/MainScreen.dart';
import 'package:protoype_medicine/Utils/Authentication.dart';

import '../Utils/GradientButton.dart';
import '../Utils/Styles.dart';

enum PatientSex { Male, Female }
PatientSex _sex = PatientSex.Male;
AuthImplementation auth;
final firebaseStore = Firestore.instance;
String _Email = "";
String _password = "";
String _name = "";
String _DoctorCode = "";

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
  void validateAndSubmit() async {
    try {
      //if user wants to register >>> make it as register
      String userID = await auth.Signup(_Email, _password);
      print("Registered user ID : " + userID);
      firebaseStore.collection('users').add({
        'userType': 'patient',
        'name': _name,
        'sex': _sex == PatientSex.Male ? 'male' : 'female',
        'ID': userID,
        'doctorCode': _DoctorCode,
        'email': _Email,
        'password': _password,
        'spots': List<double>(),
      });
      Navigator.popAndPushNamed(context, MainScreen.id);
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
        backgroundColor: Colors.white,
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
                      left: 25.0, right: 25, bottom: 10, top: 100),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _name = value;
                    },
                    onSubmitted: (value) {
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
                    onSubmitted: (value) {
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
                    keyboardType: TextInputType.emailAddress,
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
                      left: 100.0, right: 100, bottom: 2, top: 25),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _DoctorCode = value;
                    },
                    onSubmitted: (value) {
                      _DoctorCode = value;
                    },
                    decoration: KInputTextDecorationSmall.copyWith(
                        hintText: "Doctor Code"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text('Male'),
                          leading: Radio(
                            value: PatientSex.Male,
                            groupValue: _sex,
                            onChanged: (PatientSex value) {
                              setState(() {
                                _sex = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Female'),
                          leading: Radio(
                            value: PatientSex.Female,
                            groupValue: _sex,
                            onChanged: (PatientSex value) {
                              setState(() {
                                _sex = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
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
//                        Navigator.pushNamed(context, MainScreen.id);
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
  }
}
