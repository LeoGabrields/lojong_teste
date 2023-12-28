import 'package:flutter/widgets.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get fontFamily => 'Asap';

  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily,
        fontSize: 13,
      );

  TextStyle get textSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        fontSize: 13,
      );

  TextStyle get textTitle => TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        fontSize: 13.51,
        letterSpacing: 1.13,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
