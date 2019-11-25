import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protoype_medicine/PatientApp/RecordsScreen.dart';
import 'package:protoype_medicine/Utils/Authentication.dart';

class Measurements extends StatefulWidget {
  static String id = 'measurementsscreen';
  @override
  _MeasurementsState createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  AuthImplementation auth;
  final _auth = FirebaseAuth.instance;
  FirebaseUser _firebaseUser;
  final firebaseStore = Firestore.instance;
  ScrollController _scrollController;

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          splashColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, Records.id);
          },
        ),
        appBar: AppBar(
          title: Text('Your measurements'),
        ),
        body: false
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    stream: firebaseStore.collection('spots').snapshots(),
                    // ignore: missing_return
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<SpotListeItem> messagesWidgets = [];
                        var spots = snapshot.data.documents;
                        for (var spot in spots) {
                          final uid = spot.data['uid'];
                          var currentUID = _firebaseUser.uid;
                          if (uid == currentUID) {
                            final messageWidget = SpotListeItem(
                              note: spot.data['note'],
                              date:
                                  spot.data['date'].toString().substring(0, 10),
                              amount: spot.data['amount'],
                              measured: spot.data['measured'],
                              tag: spot.data['tag'],
                            );
                            messagesWidgets.add(messageWidget);
                          }
                        }
                        return Expanded(
                          flex: 1,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            reverse: false,
                            controller: _scrollController,
                            children: messagesWidgets,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    auth = new Auth();
    getCurrentUser();
    _scrollController = ScrollController(keepScrollOffset: true);
  }
}

class SpotListeItem extends StatelessWidget {
  const SpotListeItem(
      {this.measured, this.note, this.amount, this.date, this.tag});
  final String measured;
  final String note;
  final String amount;
  final String date;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8, bottom: 8),
      child: Card(
        elevation: 5,
        child: Container(
          width: double.infinity,
          height: 120,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text('Date : $date'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Measured',
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Notes',
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Tags',
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        measured,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        note,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        tag,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      '$amount \n mmOI/L',
                      style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
