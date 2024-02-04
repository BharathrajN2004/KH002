import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_provider.dart';

class CustomColorData {
  final Color Function(double) fontColor;
  final Color Function(double) primaryColor;
  final Color Function(double) backgroundColor;
  final Color Function(double) secondaryColor;
  final Gradient backgroundGradient;
  final Gradient bottomIconGradient;
  final Color bottomNavBarColor;

  CustomColorData({
    required this.fontColor,
    required this.primaryColor,
    required this.backgroundColor,
    required this.bottomNavBarColor,
    required this.secondaryColor,
    required this.backgroundGradient,
    required this.bottomIconGradient,
  });

  factory CustomColorData.from(WidgetRef ref) {
    Map<ThemeMode, Color> themeMap = ref.watch(themeProvider);
    ThemeMode themeMode = themeMap.keys.first;
    bool isDark = themeMode == ThemeMode.dark;
    Color statePrimaryColor = themeMap.values.first;

    Color fontColor(double opacity) => isDark
        ? const Color(0XFFF4F4F4).withOpacity(opacity)
        : const Color(0XFF1D1F20).withOpacity(opacity);

    Color primaryColor(double opacity) =>
        statePrimaryColor.withOpacity(opacity);

    Gradient _backgroundGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0XFF1D2748),
        Color(0XFF161616),
      ],
    );

    Gradient _bottomIconGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0XFF797DE2),
        Color(0XFFAA3FF5),
      ],
    );

    Color secondaryColor(double opacity) => isDark
        ? Color.fromARGB(255, 36, 36, 55).withOpacity(opacity)
        : Colors.white.withOpacity(opacity);

    Color backgroundColor(double opacity) =>
        isDark ? const Color(0XFF252B32) : Color.fromARGB(255, 248, 245, 253);

    Color bottomNavBarColor = isDark ? const Color(0xFF2F3842) : Colors.white;

    return CustomColorData(
      fontColor: fontColor,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      bottomNavBarColor: bottomNavBarColor,
      secondaryColor: secondaryColor,
      backgroundGradient: _backgroundGradient,
      bottomIconGradient: _bottomIconGradient,
    );
  }
}
