//colors from light theme and dark theme are taken and made combination
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

//linear combination of light theme
const mainGradientlight = LinearGradient(
    colors: [primaryLightColorLight, primaryColorLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
//linear combination of dark theme
const mainGradientDark = LinearGradient(
    colors: [primaryDarkColorDark, primaryColorDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
//to check which mode you are in,we call it from ui
LinearGradient mainGradient(BuildContext context) =>
    UIparameters.isDarkMode(context) ? mainGradientDark : mainGradientlight;
