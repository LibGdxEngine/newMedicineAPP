import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/Styles.dart';

String amount;
String note;
String tag;
String measured;

class Records extends StatefulWidget {
  static const String id = 'recordscreen';
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  var showInputField = true;
  String dropdownValue = 'before breakfast';

  void onSubmitt(value) {
    setState(() {
      print("Submitted");
      amount = value;
    });
  }

  FirebaseUser _firebaseUser;
  final _auth = FirebaseAuth.instance;
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

  final firebaseStore = Firestore.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    measured = dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Record'),
        ),
        body: showInputField
            ? SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    InputField(onSubmitt),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: NoteInputField(),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.access_time),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            measured = dropdownValue;
                          });
                        },
                        items: <String>[
                          'before breakfast',
                          'after breakfast',
                          'before lunch',
                          'after lunch',
                          'before dinner',
                          'after dinner'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.blueAccent,
                        elevation: 5,
                        child: FlatButton(
                          onPressed: () {
                            if (amount != null && measured != null) {
                              if (int.parse(amount) >= 120 &&
                                  int.parse(amount) <= 180) {
                                tag = 'Good';
                              } else if (int.parse(amount) >= 181 &&
                                  int.parse(amount) <= 260) {
                                tag = 'Sugar';
                              } else {
                                tag = 'Glucose';
                              }
                              firebaseStore.collection('spots').add({
                                'note':
                                    note == null || note.isEmpty ? '' : note,
                                'tag': tag,
                                'measured': measured,
                                'date': DateTime.now().toIso8601String(),
                                'amount': amount,
                                'uid': _firebaseUser.uid,
                              });
                              amount = null;
                              note = null;
                              measured = null;

                              print('done');

                              setState(() {
                                showInputField = false;
                              });
                              Future.delayed(Duration(milliseconds: 1500), () {
                                Navigator.pop(context);
                              });
                            } else {
                              print('not done');
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return FancyDialog(
                                    theme: FancyTheme.FANCY,
                                    okColor: Colors.blueAccent,
                                    cancelColor: Colors.white,
                                    title: "Complete your info",
                                    descreption: "Enter a valid input ",
                                  );
                                },
                              );
                            }
                          },
                          splashColor: Colors.blue,
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

Widget InputField(Function onSubmitt) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 150,
      child: TextField(
        style: TextStyle(fontSize: 60, color: Colors.green),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          onSubmitt(value);
        },
        onSubmitted: (value) {
          onSubmitt(value);
        },
        decoration: KInputTextDecorationRecord.copyWith(
            hintText: "Enter your measurement"),
      ),
    ),
  );
}

class NoteInputField extends StatefulWidget {
  @override
  _NoteInputFieldState createState() => _NoteInputFieldState();
}

class _NoteInputFieldState extends State<NoteInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        enabled: true,
        style: TextStyle(fontSize: 15, color: Colors.blue),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          note = value;
        },
        onSubmitted: (value) {
          note = value;
        },
        decoration: KInputTextDecorationSmall.copyWith(
          hintText: 'Notes',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
      ),
    );
  }
}
