import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Cerco',
    colorScheme:const  ColorScheme.dark(
      brightness: Brightness.dark,
      primary:Color(0xFF6B7DEB),
      secondary:  Color(0xFFFFFFFF),
      tertiary: Color(0xFFECCA2E),
      error: Color(0xFFD81003),
      background: Color(0xFF12122E),
      onBackground: Color(0xFF1F1F47),
      surface:  Color(0xFF93A7C8),
      onSurface:  Color(0xFF64D2FF),
    )
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Cerco',
    colorScheme:const  ColorScheme.light(
      brightness: Brightness.light,
      primary:Color(0xFF6B7DEB),
      secondary:  Color(0xFF000000),
      tertiary: Color(0xFFEEBD01),
      error: Color(0xFFD81003),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0x801F1F47),
      surface:  Color(0xFF696868),
      onSurface:  Color(0xFF16BFFE),
    )
);