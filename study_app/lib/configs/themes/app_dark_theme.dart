
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColorDark=Color(0xFF3e3c62);
const Color primaryColorDark=Color(0xFF99ace1);
const Color mainTextColorDark=Colors.white;
//to inherit properties from mixin subtheme data
class DarkTheme with SubThemeData{
  ThemeData buildDarkTheme(){
    //theme.light returns the default theme color of the app
    final ThemeData systemDarkTheme=ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      )
    );
  }

}