import 'package:flutter/material.dart';
import 'package:oranos/constance/themes/colors.dart';

const String _themeFont = 'Poppins';
const String sFProText = 'SFProText';

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class AppTheme {
  static Color mainColor = const Color(0xFF16919B);
  static final MaterialColor primarySwatch =
      ColorsSwatch.primarySwatch(mainColor);
  static Color secondColor = const Color(0xFF1BC5BD);
  static Color blueColor = const Color(0xFF3699FF);
  static Color warningColor = const Color(0xFFFFA800);
  static Color borderColor = const Color(0xFFCFD9DE);
  static Color greyColor = const Color(0xFF77838F);
  static Color textColor = const Color(
    0xFFb3b3b3,
  );

  ThemeData theme() => ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primarySwatch: primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: _themeFont,
        textTheme: const TextTheme(
          labelMedium: TextStyle(
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 14,
            height: 1.2,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 12,
            height: 1.2,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
            height: 1.2,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14,
            height: 1.2,
          ),
          displayLarge: TextStyle(
            fontSize: 20,
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontSize: 18,
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.7,
          ),
          headlineMedium: TextStyle(
            fontSize: 13,
            color: Colors.black,
            height: 1.2,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
        ),
      );
}
