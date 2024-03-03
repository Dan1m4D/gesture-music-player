import 'package:flutter/material.dart';
import 'package:gesture_music_app/themes/dark_mode.dart';
import 'package:gesture_music_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  // Default theme is lightmode
  ThemeData _themeData = lightMode;

  // Getter for theme data
  ThemeData get themeData => _themeData;

  // is dark mode?
  bool get isDarkMode => _themeData == darkMode;

  // set theme
  set themeData(ThemeData theme){
    _themeData = themeData;

    // update ui
    notifyListeners();
  }

  // toggle theme
  void toggleTheme(){
    _themeData = isDarkMode ? lightMode : darkMode;
    notifyListeners();
  }
  
}