import 'package:flutter/material.dart';

class BloodPressureSymptoms extends StatefulWidget {
  static final String id = 'bloodpressuresymptoms';
  @override
  _BloodPressureSymptomsState createState() => _BloodPressureSymptomsState();
}

class _BloodPressureSymptomsState extends State<BloodPressureSymptoms> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Blood Pressure'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              ' Blood pressure Symptoms:',
              style: TextStyle(fontSize: 30, color: Colors.blueAccent),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  "\n1. Severe headache \n2. Fatigue or confusion \n3. Vision problems \n4. Chest pain \n5. Difficulty breathing \n6. Irregular heartbeat \n7. Blood in the urine \n8. Pounding in your chest, neck, or ears",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
