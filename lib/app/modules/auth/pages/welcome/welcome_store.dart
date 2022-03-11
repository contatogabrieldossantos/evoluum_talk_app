import 'package:app.com.walkie/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'welcome_store.g.dart';

class WelcomeStore = _WelcomeStoreBase with _$WelcomeStore;
abstract class _WelcomeStoreBase with Store {

  final _appController = Modular.get<AppController>();

  _WelcomeStoreBase() {
    _appController.determineAuthStatus();
  }

}