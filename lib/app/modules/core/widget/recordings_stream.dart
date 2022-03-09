import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:app.com.walkie/app/modules/core/widget/recording_row.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:audioplayers/audioplayers.dart';

class RecordingsStream extends StatefulWidget {
  @override
  _RecordingsStreamState createState() => _RecordingsStreamState();
}

class _RecordingsStreamState extends State<RecordingsStream> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String? currentlyPlayingFilename;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerCompletion.listen((event) {
      isPlaying = false;
      setState(() {
        currentlyPlayingFilename = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('walkie')
          .orderBy(
            'filename',
            descending: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<RecordingRow> rows = [];
          for (var document in snapshot.data!.docs) {
            rows.add(
              RecordingRow(
                filename: (document.data() as Map)['filename'],
                currentlyPlayingFilename: currentlyPlayingFilename,
                onTap: (String filename) {
                  setState(() {
                    currentlyPlayingFilename =
                        currentlyPlayingFilename == filename ? null : filename;
                  });
                  isPlaying ? stopPlaying(filename) : startPlaying(filename);
                },
              ),
            );
          }
          return Expanded(
            child: ListView(
              children: rows,
              reverse: true,
            ),
          );
        } else if (!snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Constants.kColourPrimary!),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void startPlaying(String filename) async {
    final url =
        await FirebaseStorage.instance.ref().child(filename).getDownloadURL();
    int result = await audioPlayer.play(url);
    if (result == 1) {
      isPlaying = true;
    } else {
      print('Error playing file.');
    }
  }

  void stopPlaying(String filename) async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      isPlaying = false;
      if (currentlyPlayingFilename != null) {
        startPlaying(filename);
      }
    } else {
      print("Can't stop playing!");
    }
  }
}
