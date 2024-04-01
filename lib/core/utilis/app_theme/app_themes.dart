import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.tajawalTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 189, 69, 241),
      primary: const Color.fromARGB(255, 189, 69, 241),
    ),
  );
  static final lightTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.tajawalTextTheme(),
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: Colors.brown,
    //   primary: Colors.brown,
    // ),
  );
}
