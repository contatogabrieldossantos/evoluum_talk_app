import 'package:app.com.walkie/app/modules/home/pages/walkie_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute<String>('/', child: (_, __) => WalkieScreen()),
  ];

}
