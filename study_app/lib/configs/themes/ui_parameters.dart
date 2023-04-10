//able to know which mode you are in
import 'package:flutter/material.dart';

class UIparameters {
  //it checks the screen that passed the context has dark mode or not
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
