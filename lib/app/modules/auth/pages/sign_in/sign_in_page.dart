import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:app.com.walkie/app/modules/core/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sign_in_store.dart';

class SignInPage extends StatefulWidget {
  final String title;
  const SignInPage({Key? key, this.title = 'SignInPage'}) : super(key: key);
  @override
  SignInPageState createState() => SignInPageState();
}
class SignInPageState extends ModularState<SignInPage, SignInStore> {
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
        controller.signIn(email, password);
      },
    );
  }
}