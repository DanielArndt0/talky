// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/NamedRoutes.dart';

class AppColors {
  // Primary Color
  static const MaterialColor primaryMaterialColor = MaterialColor(
    0xFF377DFF,
    primaryColorMap,
  );
  static const Color primaryColor = Color(0xFF377DFF);
  static const Map<int, Color> primaryColorMap = {
    50: Color.fromRGBO(55, 125, 255, .1),
    100: Color.fromRGBO(55, 125, 255, .2),
    200: Color.fromRGBO(55, 125, 255, .3),
    300: Color.fromRGBO(55, 125, 255, .4),
    400: Color.fromRGBO(55, 125, 255, .5),
    500: Color.fromRGBO(55, 125, 255, .6),
    600: Color.fromRGBO(55, 125, 255, .7),
    700: Color.fromRGBO(55, 125, 255, .8),
    800: Color.fromRGBO(55, 125, 255, .9),
    900: Color.fromRGBO(55, 125, 255, 1),
  };

  // Background
  static const Map<String, Color> screenBackground = {
    NamedRoutes.splash: primaryColor,
    NamedRoutes.signIn: Color(0xFFF7F7F9),
    NamedRoutes.profile: Colors.white,
    NamedRoutes.signInEnter: Colors.white,
  };

  // Font
  static const Color primaryFontColor = Color(0xFF243443);

  // Button
  static const Color buttonColor = Colors.white;

  // AppFormField
  static const Color hintTextColor = Color(0xFFAAB0B7);
  static const Color borderColor = Color(0xFF58616A);

  // User Avatar Colors
  static const List<Color> userAvatarBackgrounds = [
    Colors.blue,
    Colors.amber,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.black,
  ];
}
