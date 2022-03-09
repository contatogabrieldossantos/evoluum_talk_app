import 'package:app.com.walkie/app/modules/core/config/constanst.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final bool isSignIn;
  final Function onFormSubmitted;

  AuthForm({
    required this.isSignIn,
    required this.onFormSubmitted,
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Constants.appName)),
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
              SizedBox(height: 30),
              Text(
                widget.isSignIn ? 'SIGN IN' : 'REGISTER',
                style: Constants.kTextStyleTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: Constants.kTextStyleFormTextField,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter your email',
                        hintStyle: Constants.kTextStyleFormHint,
                      ),
                      validator: (String? value) {
                        return value!.contains('@')
                            ? null
                            : 'You\'re missing an @.';
                      },
                      onChanged: (String value) {
                        email = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      style: Constants.kTextStyleFormTextField,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter your password',
                        hintStyle: Constants.kTextStyleFormHint,
                      ),
                      validator: (String? value) {
                        return value!.length < 6
                            ? 'Use at least 6 characters!'
                            : null;
                      },
                      onChanged: (String value) {
                        password = value;
                      },
                    ),
                    SizedBox(height: 30.0),
                    RaisedButton(
                      child: Text(
                        widget.isSignIn ? 'Sign In' : 'Register',
                        style: Constants.kTextStyleFormButton,
                      ),
                      padding: Constants.kPaddingFormButton,
                      color: Constants.kColourPrimary,
                      onPressed: () async {
                        FormState? formState = Form.of(primaryFocus!.context!);
                        if (formState!.validate()) {
                          widget.onFormSubmitted(email, password);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
