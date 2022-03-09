import 'package:app.com.walkie/app/modules/auth/pages/register_screen.dart';
import 'package:app.com.walkie/app/modules/auth/pages/signin_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/welcome_screen.dart';

class AuthModule extends Module {

  @override
  List<Bind> get binds => [
   
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute<String>('/', child: (_, __) => WelcomeScreen()),
    ChildRoute<String>('/login', child: (_, __) => SignInScreen()),
    ChildRoute<String>('/register', child: (_, __) => RegisterScreen()),
  ];
  
}