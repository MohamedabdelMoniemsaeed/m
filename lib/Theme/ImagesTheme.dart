import 'package:flutter/widgets.dart';

abstract class ImagesTheme {
  String pathimages = "assets/images/";
}



class HOME {
  HOME._();

  static const _kFontFam = 'HOME';
  static const String? _kFontPkg = null;

  static const IconData home = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData video = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData subscriptions = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
