import 'app_controller.dart';
import 'modules/auth/auth_module.dart';
import 'modules/core/services/firebase_auth_service.dart';
import 'modules/core/services/firebase_fire_store_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/core/config/constanst.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<FirebaseAuthService>((i) => FirebaseAuthService(),
        isSingleton: true, isLazy: true),
    Bind<FirebaseFireStoreService>((i) => FirebaseFireStoreService(),
        isSingleton: true, isLazy: true),
    Bind<AppController>((i) => AppController(),
        isSingleton: true, isLazy: true),
  ];

  @override
  List<ModularRoute> routes = [
    ModuleRoute('/home',
        module: HomeModule(), duration: Constants.defaultDuration),
    ModuleRoute('/', module: AuthModule(), duration: Constants.defaultDuration),
  ];
}
