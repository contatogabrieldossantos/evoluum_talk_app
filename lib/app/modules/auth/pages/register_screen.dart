import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:app.com.walkie/app/modules/core/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthForm(
      isSignIn: false,
      onFormSubmitted: (email, password) async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Constants.kColourPrimary!),
              ),
            );
          },
        );
        try {
          final newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, 'home');
        } catch (error) {
          Navigator.pop(context);
          print(error);
        }
      },
    );
  }
}
