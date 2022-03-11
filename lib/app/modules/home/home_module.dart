import 'package:app.com.walkie/app/modules/home/pages/home_page.dart';
import 'package:app.com.walkie/app/modules/home/pages/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {

  @override
  List<Bind> get binds => [
    Bind<HomeStore>((i) => HomeStore(),
            isSingleton: true, isLazy: true),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute<String>('/', child: (_, __) => HomePage()),
  ];
}
