import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color(0xff561f0f),
    primary: Color(0xff8f4c38),
    secondary: Color(0xffffb5a0),
  ),
);
ThemeData darktMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color(0xff1a1b20),
    primary: Color(0xff44474f),
    secondary: Color(0xff74777f),
  ),
);
