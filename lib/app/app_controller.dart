import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';


part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  @observable
  User? user;

  @action
  determineAuthStatus() async {
    try {
      user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        Modular.to.pushNamed('/home');
      }
    } catch (error) {
      print(error);
    }

  }

}
