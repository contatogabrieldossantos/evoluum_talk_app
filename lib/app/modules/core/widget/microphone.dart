import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:record/record.dart';

class Microphone extends StatelessWidget {
  final bool isRecording;
  final Function onStartRecording;
  final Function onStopRecording;

  Microphone({
    required this.isRecording,
    required this.onStartRecording,
    required this.onStopRecording,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 96.0,
        color: isRecording ? Constants.kColourIsRecording : Constants.kColourPrimary,
        child: Icon(
          Icons.mic,
          size: 48.0,
          color: Colors.white,
        ),
      ),
      onTapDown: (TapDownDetails details) {
        startRecording();
      },
      onTapUp: (TapUpDetails details) {
        stopRecording();
      },
    );
  }

  void startRecording() async {
    try {
      // if (await hasPermissions()) {
        onStartRecording();
        String recording = await getFilePath();
        await Record().start(
          path: recording, // required
          encoder: AudioEncoder.AAC, // by default
          bitRate: 128000, // by default
          samplingRate: 44100, // by default
        );

      // }
    } catch (error) {
      print(error);
    }
  }

  void stopRecording() async {
    print('------> stopRecordings');
    if (isRecording) {
      onStopRecording();
      final recording = await Record().stop();
      sendRecording(recording!);
    }
  }

  void sendRecording(String path) {
    final fileName = path.split('/').last;
    FirebaseStorage.instance.ref().child(fileName).putFile(File(path));
    FirebaseFirestore.instance.collection('walkie').add({'filename': fileName});
  }

  Future<bool> hasPermissions() async {
    var status = await Permission.microphone.status;
    switch (status) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.limited:
      case PermissionStatus.denied:
        Permission.microphone.request();
        break;
      case PermissionStatus.restricted:
        print('Microphone access is restricted. You cannot use this app.');
        break;
      case PermissionStatus.permanentlyDenied:
        print('Microsoft access is permanently denied. '
            'You have to go to Settings to enable it.');
        break;
    }
    return false;
  }

  Future<String> getFilePath() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String timestamp = DateTime.now().toIso8601String();
    return appDocDirectory.path + '/recording_' + timestamp + '.m4a';
  }
}
