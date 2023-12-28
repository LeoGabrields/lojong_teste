import 'package:flutter/widgets.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFFE09090);
}

extension ColorsAppExceptions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
