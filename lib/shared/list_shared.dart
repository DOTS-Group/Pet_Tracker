import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pet_tracker/models/splash%20intro%20login/loginotherbutton_model.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class SharedList {
  // Intro Page
  static List<String> introPageImageList = [
    'assets/images/intropage/intropage_image1.png',
    'assets/images/intropage/intropage_image2.png',
    'assets/images/intropage/intropage_image3.png',
  ];

  static List<DropdownMenuItem> langugeSettingList = [
    const DropdownMenuItem(
      value: "tr",
      child: Text("Türkçe"),
    ),
    const DropdownMenuItem(
      value: "en",
      child: Text("English"),
    ),
  ];

  // Login Page
  static List<LoginOtherLoginButton> loginOtherLoginButtonList = [
    LoginOtherLoginButton(
      text: "Google",
      icon: FontAwesome.google_brand,
      backgroundColor: SharedConstants.whiteColor,
      iconColor: SharedConstants.blackColor,
      textColor: Colors.black,
    ),
    LoginOtherLoginButton(
      text: "Instagram",
      icon: FontAwesome.instagram_brand,
      backgroundColor: SharedConstants.orangeColor,
      iconColor: Colors.white,
      textColor: Colors.white,
    ),
  ];
  static List<IconData> loginPageTextFormIconList = [
    Icons.email,
    Icons.lock,
  ];

  // Pattern Page
  static List<IconData> patternPageIconList = [
    Icons.home,
    Icons.location_on,
    Icons.pets_rounded,
    Icons.calendar_month,
    Icons.account_circle_rounded,
  ];

  // Home Page
  static List<String> homepageStoriesImageRouteList = [
    "assets/images/home/homepage/stories1.png",
    "assets/images/home/homepage/stories2.png",
    "assets/images/home/homepage/stories3.png",
    "assets/images/home/homepage/stories4.png",
  ];

}
