import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Monteserrat-Regular',
  colorScheme:const  ColorScheme.dark(
      brightness: Brightness.dark,
      primary:Color(0xFF6B7DEB),
      secondary:  Color(0xFFFFFFFF),
      error: Color(0xFFD81003),
      background: Color(0xFF12122E),
      onBackground: Color(0xFF1F1F47),
      surface:  Color(0xFF93A7C8),
      onSurface:  Color(0xFF64D2FF),
  )
);