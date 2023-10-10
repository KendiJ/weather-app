import 'package:flutter/material.dart';

class AppThemes {
  static Color sunny = const Color(0xFF47AB2F);
  static Color rainy = const Color(0xFF57575D);
  static Color cloudy = const Color(0xFF54717A);

  static Color getDynamicTheme({required String weatherCondition}) {
    switch (weatherCondition) {
      case "Cloudy":
        return cloudy;
      case "Rainy":
        return rainy;
      case "Sunny":
        return sunny;
      default:
        return cloudy;
    }
  }
}
