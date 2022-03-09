import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:flutter/material.dart';


class RecordingRow extends StatelessWidget {
  final String filename;
  final String? currentlyPlayingFilename;
  final Function onTap;

  RecordingRow({
    required this.filename,
    required this.currentlyPlayingFilename,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: currentlyPlayingFilename == filename
            ? Constants.kColourPrimaryRecording
            : Constants.kColourBackground,
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(
              currentlyPlayingFilename == filename
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_filled,
              size: 36.0,
              color: currentlyPlayingFilename == filename
                  ? Colors.white
                  : Constants.kColourPrimary,
            ),
            SizedBox(width: 16.0),
            Text(
              DateTime.parse(filename.split('_').last.substring(0, 25)).toString(),
              style: currentlyPlayingFilename == filename
                  ? Constants.kTextStyleRecordingPlaying
                  : Constants.kTextStyleRecording,
            ),
          ],
        ),
      ),
      onTap: () {
        onTap(filename);
      },
    );
  }
}
