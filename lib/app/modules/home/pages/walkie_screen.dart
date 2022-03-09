import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:app.com.walkie/app/modules/core/widget/microphone.dart';
import 'package:app.com.walkie/app/modules/core/widget/recordings_stream.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalkieScreen extends StatefulWidget {
  static const String id = '/home';

  @override
  _WalkieScreenState createState() => _WalkieScreenState();
}

class _WalkieScreenState extends State<WalkieScreen> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isRecording ? Constants.kColourIsRecording : Constants.kColourPrimary,
      appBar: AppBar(
        title: Text(Constants.kAppTitle, style: Constants.kTextStyleAppTitle),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            child: Text('Sign out', style: Constants.kTextStyleLogOutButton),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Constants.kColourBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RecordingsStream(),
              Microphone(
                isRecording: isRecording,
                onStartRecording: () {
                  setState(() {
                    isRecording = true;
                  });
                },
                onStopRecording: () {
                  setState(() {
                    isRecording = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
