import 'package:flutter/material.dart';

//light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color.fromRGBO(208, 162, 247, 100),
    primary: Color.fromRGBO(202, 162, 251, 0.612),
    secondary: Color.fromRGBO(229, 212, 255, 100),
    onPrimary: Color.fromRGBO(241, 234, 255, 100),
    tertiary: Color.fromRGBO(85, 37, 127, 0.875),
    onBackground: Color.fromRGBO(36, 21, 50, 0.875),
  ),
);

//dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color.fromRGBO(82, 43, 115, 0.612),
    primary: Color.fromRGBO(128, 84, 181, 0.612),
    secondary: Color.fromRGBO(132, 105, 174, 0.612),
    onPrimary: Color.fromRGBO(171, 155, 207, 0.612),
    tertiary: Color.fromRGBO(176, 152, 198, 0.875),
    onBackground: Color.fromRGBO(193, 136, 247, 0.875),
  ),
);
