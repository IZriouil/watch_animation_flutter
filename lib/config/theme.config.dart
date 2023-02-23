import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Color(0xFFB38D85),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          headline1: GoogleFonts.raleway(fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: GoogleFonts.raleway(fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: GoogleFonts.raleway(fontSize: 49, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.raleway(fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: GoogleFonts.raleway(fontSize: 24, fontWeight: FontWeight.w400),
          headline6: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: GoogleFonts.questrial(fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: GoogleFonts.questrial(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: GoogleFonts.questrial(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: GoogleFonts.questrial(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: GoogleFonts.questrial(fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ));
    // return ThemeData(
    //   primaryColor: Colors.lightBlue,
    //   accentColor: Colors.white,
    //   backgroundColor: Colors.white,
    //   scaffoldBackgroundColor: Colors.white,
    //   textTheme: TextTheme(
    //     headline1: TextStyle(color: Colors.black),
    //     headline2: TextStyle(color: Colors.black),
    //     bodyText1: TextStyle(color: Colors.black),
    //     bodyText2: TextStyle(color: Colors.black),
    //   ),
    // );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.yellow,
    );
  }
}
