  import 'package:flutter/material.dart';

abstract class Constants {

  static const String appName = 'Evoluum Talk';
  static const defaultDuration = Duration(seconds: 2);

  static final kColourPrimary = Colors.purple[800];
  static final kColourPrimaryRecording = Colors.deepPurple;
  static final kColourBackground = Colors.lightGreen[200];

  static final kColourIsRecording = Colors.red[800];

  static const kAppTitle = 'Walkie';

  static const kTextStyleAppTitle = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 23.0,
  );

  static const kTextStyleTitle = TextStyle(
    fontFamily: 'Courier-Prime-Bold',
    fontSize: 27.0,
  );

  static const kTextStyleFormTextField = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 18.0,
    color: Colors.black,
  );
  static const kTextStyleFormHint = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 18.0,
  );
  static const kTextStyleFormButton = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 23.0,
    color: Colors.white,
  );

  static const kTextStyleLogOutButton = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 18.0,
    color: Colors.white,
  );

  static const kTextStyleRecording = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 14.0,
    color: Colors.black,
  );
  static const kTextStyleRecordingPlaying = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 14.0,
    color: Colors.white,
  );

  static const kPaddingSafeArea = EdgeInsets.all(16.0);
  static const kPaddingFormButton = EdgeInsets.all(12.0);

} 

