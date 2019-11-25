import 'package:flutter/material.dart';

class BloodPressureTreatment extends StatefulWidget {
  static final String id = 'bloodpressuretreatment';
  @override
  _BloodPressureTreatmentStates createState() =>
      _BloodPressureTreatmentStates();
}

class _BloodPressureTreatmentStates extends State<BloodPressureTreatment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Blood Pressure'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  '  Treatment:',
                  style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "  \n\n1. Eating a heart-healthy diet with less salt \n\n2. Getting regular physical activity \n\n3. Maintaining a healthy weight or losing weight \nif you're overweight or obese \n\n4. Limiting the amount of alcohol, you drink",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Recommended medicines:',
                      style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "  \n\n1. Calcium channel blockers. (it includes amlodipine \n(Norvasc), diltiazem (Cardizem, Tiazac, others)) \n\n2. Thiazide diuretics. \n\n3. Angiotensin II receptor blockers (ARBs). \nif you're overweight or obese \n\n4. Angiotensin-converting enzyme (ACE) inhibitors.",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
