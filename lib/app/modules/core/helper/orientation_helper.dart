import 'package:flutter/services.dart';

mixin OrientationHelper {

  void lockOrientation() =>
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

}