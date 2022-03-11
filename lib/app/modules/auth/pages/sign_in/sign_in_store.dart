import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;
abstract class _SignInStoreBase with Store {

  @action
  signIn(String email, String password) async {
    try {

      final signedInUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Modular.to.pop();
      Modular.to.pushReplacementNamed('/home');

    } catch (error) {
      Modular.to.pop();
      print(error);
    }
  }

}