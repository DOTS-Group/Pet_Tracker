import 'package:flutter/material.dart';

import 'constants_shared.dart';

class SharedTheme {
  static double height = 0;
  static double width = 0;
  // TextTheme
  static TextTheme textTheme(bool isDarkTheme) {
    return TextTheme(
      // Header
      displayLarge: TextStyle(
        fontSize: height * SharedConstants.displayLargeFontSize,
        fontWeight: FontWeight.bold,
        color: isDarkTheme == true
            ? SharedConstants.primaryTextColorDark
            : SharedConstants.primaryTextColorLight,
      ),
      displayMedium: TextStyle(
        fontSize: height * SharedConstants.displayMediumFontSize,
        fontWeight: FontWeight.bold,
        color: isDarkTheme == true
            ? SharedConstants.primaryTextColorDark
            : SharedConstants.primaryTextColorLight,
      ),
      displaySmall: TextStyle(
        fontSize: height * SharedConstants.displaySmallFontSize,
        fontWeight: FontWeight.bold,
        color: isDarkTheme == true
            ? SharedConstants.primaryTextColorDark
            : SharedConstants.primaryTextColorLight,
      ),
      // Body
      bodyLarge: TextStyle(
        fontSize: height * SharedConstants.bodyLargeFontSize,
        fontWeight: FontWeight.bold,
        color: isDarkTheme == true
            ? SharedConstants.primaryTextColorDark
            : SharedConstants.primaryTextColorLight,
      ),
      bodyMedium: TextStyle(
        fontSize: height * SharedConstants.bodyMediumFontSize,
        fontWeight: FontWeight.bold,
        color: isDarkTheme == true
            ? SharedConstants.primaryTextColorDark
            : SharedConstants.primaryTextColorLight,
      ),
      bodySmall: TextStyle(
        fontSize: height * SharedConstants.bodySmallFontSize,
        fontWeight: FontWeight.bold,
        color: isDarkTheme == true
            ? SharedConstants.primaryTextColorDark
            : SharedConstants.primaryTextColorLight,
      ),
    );
  }

  static ThemeData lightTheme = ThemeData(
    primaryColor: SharedConstants.primaryColorLight,
    scaffoldBackgroundColor: SharedConstants.primaryColorLight,
    colorScheme: const ColorScheme.light(
      primary: SharedConstants.primaryColorLight,
      secondary: SharedConstants.secondaryColorLight,
      tertiary: SharedConstants.tertiaryColorLight,
      // Container color
      primaryContainer: SharedConstants.secondaryColorLight,
      secondaryContainer: SharedConstants.primaryColorLight,
      tertiaryContainer: SharedConstants.tertiaryColorLight,
    ),
    textTheme: textTheme(false),
    iconTheme: IconThemeData(
      color: SharedConstants.primaryTextColorLight,
      size: height * SharedConstants.displayGeneralSize * 1.25,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: SharedConstants.primaryColorDark,
    scaffoldBackgroundColor: SharedConstants.primaryColorDark,
    colorScheme: const ColorScheme.dark(
      primary: SharedConstants.primaryColorDark,
      secondary: SharedConstants.secondaryColorDark,
      tertiary: SharedConstants.tertiaryColorDark,
      // Container color
      primaryContainer: SharedConstants.secondaryColorDark,
      secondaryContainer: SharedConstants.primaryColorDark,
      tertiaryContainer: SharedConstants.tertiaryColorDark,
    ),
    textTheme: textTheme(true),
    iconTheme: IconThemeData(
      color: SharedConstants.primaryTextColorLight,
      size: height * SharedConstants.displayGeneralSize * 1.25,
    ),
  );
}