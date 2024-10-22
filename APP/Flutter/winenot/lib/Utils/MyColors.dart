import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {

  static const Color primary = Color(0x8AFFFFFF);

  // Background color
  static const Color backgroundColor = Color(0xFFfafafa);

  // Gradient
  static const Color gradientPrimary = Color(0xff8b1119);
  static const Color gradientSecondary = Color(0xffa8322e);

  static const Map<int, Color> colorCodes = {
    50: Color(0xffd08b8f),
    100: Color(0xffca8084),
    200: Color(0xffc6777c),
    300: Color(0xffc06c71),
    400: Color(0xffba6066),
    500: Color(0xffb4545a),
    600: Color(0xffaf4b51),
    700: Color(0xffab454b),
    800: Color(0xffa4373e),
    900: Color(0xffa33037),
  };

  MaterialColor mainColor = MaterialColor(0xffa4373e, MyColors.colorCodes);

  // Login
  static const Color loginText = Color(0xFFf1f1f1);
  static const Color loginIcons = Color(0xFFf1f1f1);
  static const Color loginBrandStart = Color(0xffffad9b);
  static const Color loginBrandEnd = Color(0xFFffd8c4);
  static const Color loginTextFieldUnderLine = Colors.white54;
  static const Color loginForgotPassword = Colors.white54;
  static const Color loginCursor = Colors.redAccent;
  static const Color loginTextFieldContent = Color(0xFFf1f1f1);
  static const Color loginTitle = Colors.white;
  static const Color loginButton = Color(0xffffffff);
  static const Color loginVisibility = Color(0xffc74d44);

  // Settings
  static const Color settingsPrimary = Color(0xFFc74d44);
  static const Color settingsSecondary = Color(0xFFa4373e);
  static const Color settingsIcon = MyColors.settingsPrimary;
  static const Color settingsTitle = MyColors.settingsPrimary;
  static const Color settingsSubtitle = MyColors.settingsSecondary;
  static const Color settingsMore = MyColors.settingsPrimary;

  // Dark mode
  static const Color darkBackground = Color(0xFF1C1C1C);
  static const Color darkBackgroundRecord = Color(0xFF252525);
  static const Color darkTextField = Color(0xFF858585);

  // Records
  static const Color recordsTitle = Color(0xFFf8f8f8);
  static const Color recordsSubTitle = Color(0xFF858585);
  static const Color recordsSeparator = Color(0xFF757575);
}