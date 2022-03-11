import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;
abstract class _RegisterStoreBase with Store {

  @action
  register(String email, String password) async {
    try {
      final newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      Modular.to.pop();
      Modular.to.pushReplacementNamed('home');
    } catch (error) {
      Modular.to.pop();
      print(error);
    }
  }

}