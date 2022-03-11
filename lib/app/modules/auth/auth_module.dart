import 'package:app.com.walkie/app/modules/auth/pages/register/register_page.dart';
import 'package:app.com.walkie/app/modules/auth/pages/sign_in/sign_in_page.dart';
import 'package:app.com.walkie/app/modules/auth/pages/sign_in/sign_in_store.dart';
import 'package:app.com.walkie/app/modules/auth/pages/welcome/welcome_screen.dart';
import 'package:app.com.walkie/app/modules/auth/pages/welcome/welcome_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/register/register_store.dart';
class AuthModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<SignInStore>((i) => SignInStore(),
            isSingleton: true, isLazy: false),
    Bind<WelcomeStore>((i) => WelcomeStore(),
            isSingleton: true, isLazy: true),
    Bind<RegisterStore>((i) => RegisterStore(),
            isSingleton: true, isLazy: true),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute<String>('/', child: (_, __) => WelcomeScreen()),
    ChildRoute<String>('/login', child: (_, __) => SignInPage()),
    ChildRoute<String>('/register', child: (_, __) => RegisterPage()),
  ];
}
