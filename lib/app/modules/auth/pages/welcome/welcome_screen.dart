import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'welcome_store.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends ModularState<WelcomeScreen, WelcomeStore>
    with SingleTickerProviderStateMixin {

  GlobalKey _keyParentColumn = GlobalKey();
  GlobalKey _keyChildColumn = GlobalKey();
  double _walkieHeight = 0.0;

  late Animation animationBounce;
  late Animation animationColour;

  @override
  void initState() {
    super.initState();
    // controller.determineAuthStatus();
  }

  Widget buildAnimatedWelcomeText() {
    String welcomeText = 'Welcome!';
    return Text(
      welcomeText,
      style: Constants.kTextStyleTitle,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(Constants.appName, style: Constants.kTextStyleAppTitle)),
      body: SafeArea(
        child: Padding(
          padding: Constants.kPaddingSafeArea,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 24),
                height: 320,
                child: Image.asset('assets/img/walkie.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 30),
                  buildAnimatedWelcomeText(),
                  SizedBox(height: 24),
                  RaisedButton(
                    child: Text('Sign In', style: Constants.kTextStyleFormButton),
                    padding: Constants.kPaddingFormButton,
                    color: Constants.kColourPrimary,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  SizedBox(height: 24),
                  RaisedButton(
                    child: Text('Register', style: Constants.kTextStyleFormButton),
                    padding: Constants.kPaddingFormButton,
                    color: Constants.kColourPrimary,
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
