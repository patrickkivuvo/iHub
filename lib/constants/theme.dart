import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF843667),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    foregroundColor: const Color(0xFF843667),
    textStyle: const TextStyle(
      color: Color(0xFF843667),
    ),
    shadowColor: const Color(0xFF843667),
    side: const BorderSide(color: Color(0xFF843667), width: 1.7),
    disabledForegroundColor: const Color(0xFF843667).withOpacity(0.38),
  )),
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF843667),
      textStyle: const TextStyle(fontSize: 18.0),
      disabledBackgroundColor: Colors.grey,
    ),
  ),
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);

const kPrimaryColor = Color(0xFF843667);
const kSecondaryColor = Color(0xFF022238);
const kThirdColor = Color(0xFFFFDCBC);
const kLightBackground = Color(0xFFE8F6FB);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;

class AppTheme {
  static const kBigTitle = TextStyle(
    color: kWhiteColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const kHeadingOne = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const kSeeAllText = TextStyle(color: kPrimaryColor);

  static final kBodyText = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 12,
  );

  static const kCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
