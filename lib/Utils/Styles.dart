import 'package:flutter/material.dart';

const KInputTextDecoration = InputDecoration(
  hintText: 'Enter your name',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 4.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const KInputTextDecorationSmall = InputDecoration(
  hintText: 'Doctor Code',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
);

const KInputTextDecorationRecord = InputDecoration(
  hintText: 'Doctor Code',
  hintStyle: TextStyle(fontSize: 25),
  contentPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.greenAccent, width: 4.0),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
);
const KInputTextDecorationDoctorDescription = InputDecoration(
  hintText: 'Tell us about yourself',
  hintStyle: TextStyle(fontSize: 20),
  contentPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 4.0),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
);
