import 'package:flutter/material.dart';

class SharedConstants {
  // Variables
  static String appVersion = "1.0";

  // Color
  // -> Light Theme
  static  Color primaryColorLight = Colors.white.withOpacity(0.95);
  static const Color secondaryColorLight = whiteColor;
  static const Color tertiaryColorLight = blackColor;
  static const Color primaryTextColorLight = blackColor;
  static const Color secondaryTextColorLight = whiteColor;

  // -> Dark Theme
  static const Color primaryColorDark = Color(0xFF5E17EB);
  static const Color secondaryColorDark = Color(0xFFFFFFFF);
  static const Color tertiaryColorDark = Color(0xFFD9D9D9);
  static const Color primaryTextColorDark = Color(0xFF222222);
  static const Color secondaryTextColorDark = Color(0xFF5E17EB);

  // -> Other Color Palette
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF222222);
  static const Color greyColor = Color(0xFFD9D9D9);
  static const Color purpleColor = Color(0xFF5E17EB);
  static const Color redColor = Color(0xFFFF3131);
  static const Color blueColor = Color(0xFF63B4FF);
  static const Color yellowColor = Color(0xFFFAAB4E);
  static const Color orangeColor = Color(0xFFEB7A17);
  static const Color greenColor = Color(0xFF00BF63);

  // Size
  // -> Display
  static const double displayLargeSize = 0.08;
  static const double displayMediumSize = 0.04;
  static const double displaySmallSize = 0.02;
  static const double displayGeneralSize = 0.02;

  // -> Padding
  static const double paddingExtraLarge = 0.16;
  static const double paddingLarge = 0.08;
  static const double paddingMedium = 0.04;
  static const double paddingSmall = 0.01;
  static const double paddingGenerall = 0.02;

  // Font Size
  // -> Display
  static const double displayLargeFontSize = 0.035;
  static const double displayMediumFontSize = 0.03;
  static const double displaySmallFontSize = 0.025;
  // -> Body
  static const double bodyLargeFontSize = 0.025;
  static const double bodyMediumFontSize = 0.02;
  static const double bodySmallFontSize = 0.015;

  // Image Route
  // -> Imagies
  static const String logoImageRoute = "assets/images/logo.png";
  static const String splashPageBackground =
      'assets/images/splashpage/splashpagebackground_image.png';
  static const String petAddImage = 'assets/images/home/petadd_image.png';
  // -> Icons
  static const String qrCodeFrameIcon = 'assets/icons/qrcodeframe_icon.png';
}
