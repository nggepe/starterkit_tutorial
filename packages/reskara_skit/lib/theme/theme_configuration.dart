import 'package:flutter/material.dart';
import 'theme_controller.dart';

class ThemeConfiguration {
  ///github @nggepe | Theme configuration
  ///```themeController``` merupakan Object ```ThemeController```. tekan
  ///```ctrl+click``` dan mengedit tema aplikasi anda pada kode dibawah bedasarkan kebutuhan anda
  static ThemeData switcher(ThemeController themeController) {
    switch (themeController.currentTheme) {
      case "dark":
        return ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
        );
      case "light":
        return ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
        );
      default:
        return ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
        );
    }
  }
}
