import 'package:flutter/material.dart';
import 'package:low_office/helper/theme/theme_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _tHemeData = lightMode;
  ThemeData get themeData => _tHemeData;

  set themeData(ThemeData themeData) {
    _tHemeData = themeData;
    notifyListeners();
  }

  void toggleTeme() {
    if (_tHemeData == lightMode) {
      themeData = darktMode;
    } else {
      themeData = lightMode;
    }
  }
}
