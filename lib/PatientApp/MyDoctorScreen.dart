import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorScreen extends StatefulWidget {
  static const String id = 'doctorscreen';
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.message),
          onPressed: () {
            print('Sendinf message to docotr');
          },
        ),
        appBar: AppBar(
          title: Text('Your Doctor'),
        ),
        body: buildSingleChildScrollView(screen_width),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(double screen_width) {
    return SingleChildScrollView(
      child: Container(
        width: screen_width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('images/doctor1.png'),
//              child: Image.asset('images/_.jpeg'),
            ),
            Text(
              'Dr.Jhon makron',
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Text(
                  'About The Doctor',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Lorem ipsum dolor sit amet, eu viderer vocibus pertinacia ius. Eu modus putent dissentiet vim. Velit scripta conclusionemque per ut. Per ei regione complectitur conclusionemque, et lorem comprehensam qui. Mei ei eirmod efficiantur, perfecto principes assentior nec te.',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                width: screen_width,
                height: 1,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Doctor Location',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              width: screen_width,
              height: 200,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
