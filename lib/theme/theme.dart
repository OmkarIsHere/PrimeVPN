import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    dividerColor:const Color(0xFF152033),
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

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    dividerColor:const Color(0xFFEDEDED),
    fontFamily: 'Cerco',
    colorScheme:const  ColorScheme.light(
      brightness: Brightness.light,
      primary:Color(0xFF6B7DEB),
      secondary:  Color(0xFF000000),
      tertiary: Color(0xFFEEBD01),
      error: Color(0xFFD81003),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF232D75),
      surface:  Color(0xFFECECEC),
      onSurface:  Color(0xFF16BFFE),
    )
);

