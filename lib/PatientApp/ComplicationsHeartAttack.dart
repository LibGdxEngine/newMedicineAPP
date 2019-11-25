import 'package:flutter/material.dart';

class ComplicationsHeartAttack extends StatefulWidget {
  static final String id = 'hearattack';
  @override
  _ComplicationsHeartAttackState createState() =>
      _ComplicationsHeartAttackState();
}

class _ComplicationsHeartAttackState extends State<ComplicationsHeartAttack> {
  String treatment_during_heart_attack =
      "• Manual chest compressions \n• A defibrillator";
  String treatment_following_heart_attack =
      "• Aspirin and other antiplatelets \n• Beta blockers \n• ACE (angiotensin converting enzyme) inhibitors \n• Statins \n• Angioplasty \n• CABG or coronary artery bypass graft";

  String warningsings =
      "• Discomfort, pressure, squeezing, or fullness in the chest that lasts several minutes or resolves then returns \n• Pain or discomfort in the arms, neck, back, stomach, or jaw \n• Sudden shortness of breath";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Heart Attack'),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Heart attack:',
                style: TextStyle(fontSize: 45, color: Colors.blueAccent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Symptoms',
                  style: TextStyle(fontSize: 35, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "• Coughing\n• Nausea \n• Vomiting \n• Crushing chest pain \n• Dizziness \n• Shortness of breath called dyspnea \n• Face seeming gray in color \n• A feeling of terror that life is ending \n• Feeling awful, generally \n• Restlessness \n• Feeling clammy and sweaty \n• Shortness of breath",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Treatments during a heart attack:',
                  style: TextStyle(fontSize: 35, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  treatment_during_heart_attack,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Treatments following a heart attack:',
                  style: TextStyle(fontSize: 35, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  treatment_following_heart_attack,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
