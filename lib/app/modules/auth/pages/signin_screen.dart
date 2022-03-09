import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:app.com.walkie/app/modules/core/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app.com.walkie/app/modules/home/pages/walkie_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'signin_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthForm(
      isSignIn: true,
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
          final signedInUser =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (signedInUser != null) {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, WalkieScreen.id);
          }
        } catch (error) {
          Navigator.pop(context);
          print(error);
        }
      },
    );
  }
}
