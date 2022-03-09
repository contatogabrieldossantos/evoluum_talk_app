import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.purple),
        primaryColorLight: Colors.purple,
        fontFamily: 'LimeLight', 
        primaryColor: Colors.black,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
      )
    ).modular();
  }
}
