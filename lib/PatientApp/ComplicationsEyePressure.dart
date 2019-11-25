import 'package:flutter/material.dart';

class ComplicationsEyePressure extends StatefulWidget {
  static final String id = 'eyepressure';
  @override
  _ComplicationsEyePressure createState() => _ComplicationsEyePressure();
}

class _ComplicationsEyePressure extends State<ComplicationsEyePressure> {
  String Treatment =
      "• Injections. Medicines called anti-VEGF drugs can slow down or reverse diabetic retinopathy. Other medicines, called corticosteroids, can also help. \n• Laser treatment. To reduce swelling in your retina, eye doctors can use lasers to make the blood vessels shrink and stop leaking. \n• Eye surgery. If your retina is bleeding a lot or you have a lot of scars in your eye, your eye doctor may recommend a type of surgery called a vitrectomy.";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Eye Pressure'),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Eye Pressure:',
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
                  "• High fever \n• Vision loss \n• Severe headache \n• Loss of feeling or movement in any part of your body \n• Call your doctor right away if you have any of these more serious symptoms.",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Treatments',
                  style: TextStyle(fontSize: 35, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Treatment,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: 100,),
            ],
          ),
        )),
      ),
    );
  }
}
