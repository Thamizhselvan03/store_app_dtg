import 'package:flutter/material.dart';

class LightThemeColors {
  //  2670DE
  // F1F4F9
  // 909295
  //  2c2c2c

  //dark swatch
  static const Color primaryColor = Color(0xFF2670DE);
  static const Color accentColor = Color(0xFFF1F4F9);

  //APPBAR
  static const Color appBarColor = Colors.white;

  //SCAFFOLD
  static Color scaffoldBackgroundColor = Color(0xffF1F4F9);
  static const Color backgroundColor = Colors.white;
  static const Color dividerColor = Color(0xff686868);
  static const Color cardColor = Color(0xfffafafa);
  static Color canvasColor = scaffoldBackgroundColor;

  //ICONS
  static const Color appBarIconsColor = Colors.white;
  static const Color iconColor = Color(0xff2c2c2c);

  //BUTTON
  static const Color buttonColor = primaryColor;
  static const Color buttonTextColor = Colors.white;
  static const Color buttonDisabledColor = Colors.grey;
  static const Color buttonDisabledTextColor = Colors.black;
  static const Color buttonBorderColor = Color(0xffE7E7E7);

  //TEXT
  static const Color bodyTextColor = Colors.black;
  static Color bodyTextSecondaryColor = bodyTextColor.withOpacity(.65);
  static const Color headlinesTextColor = Colors.black;
  static const Color captionTextColor = Colors.grey;
  static const Color hintTextColor = Color(0xff909295);

  //chip
  static const Color chipBackground = primaryColor;
  static const Color chipTextColor = Colors.white;

  // progress bar indicator
  static const Color progressIndicatorColor = primaryColor;
  static const Color fillColor = Colors.white;
}
