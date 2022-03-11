import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;
abstract class _HomeStoreBase with Store {

  @observable
  bool isRecording = false;

  @action
  void changeIsRecording(bool isRecording) {
    this.isRecording = isRecording;
  } 

  @action
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Modular.to.pop();
  }

}