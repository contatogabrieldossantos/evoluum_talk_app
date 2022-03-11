import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:app.com.walkie/app/modules/core/widget/microphone.dart';
import 'package:app.com.walkie/app/modules/core/widget/recordings_stream.dart';
import 'package:app.com.walkie/app/modules/home/pages/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends ModularState<HomePage, HomeStore> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kColourPrimary,
      appBar: AppBar(
        title: Text(Constants.kAppTitle, style: Constants.kTextStyleAppTitle),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            child: Text('Sign out', style: Constants.kTextStyleLogOutButton),
            onPressed: () => controller.signOut(),
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
              Observer(
                builder: (_) {
                  final isRecording = controller.isRecording;
                  return Microphone(
                    isRecording: isRecording,
                    onStartRecording: () => controller.changeIsRecording(true),
                    onStopRecording: () => controller.changeIsRecording(false),
                  );
                  
                }
              ),
            ],
          ),
        ),
      ),
    );
    
  }

}