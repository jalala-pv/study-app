
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight=Color(0xFF3ac3cb);
const Color primaryColorLight=Color(0xFFf85197);
const Color mainTextColorLight=Color.fromARGB(255, 40, 40, 40);
//to inherit properties from mixin subtheme data
class LightTheme with SubThemeData{
  ThemeData buildLightTheme(){
    //theme.light returns the default theme color of the app
    final ThemeData systemLightTheme=ThemeData.light();
    return systemLightTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      )
    );
  }

}