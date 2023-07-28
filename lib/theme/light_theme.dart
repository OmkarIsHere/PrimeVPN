import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Monteserrat-Regular',
    colorScheme:const  ColorScheme.light(
      brightness: Brightness.light,
      primary:Color(0xFF6B7DEB),
      secondary:  Color(0xFF000000),
      error: Color(0xFFD81003),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0x801F1F47),
      surface:  Color(0xFF696868),
      onSurface:  Color(0xFF16BFFE),
    )
);