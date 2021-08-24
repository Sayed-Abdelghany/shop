
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool isLight = true;
  changeTheme(){
    isLight = !isLight;
    notifyListeners();
  }
}