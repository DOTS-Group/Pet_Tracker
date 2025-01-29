import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
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
  static List<IconData> loginPageTextFormIconList = [
    Icons.email,
    Icons.lock,
  ];
  static List<IconData> registerPageTextFormIconList = [
    Icons.person_pin,
    Icons.assignment_ind,
    Icons.email,
    Icons.lock,
    Icons.lock_reset_rounded,
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

  // Activity Add Page
  static List<String> activityAddPageImageRouteList = [
    "assets/images/home/activity/food.png",
    "assets/images/home/activity/drink.png",
    "assets/images/home/activity/toilet.png",
    "assets/images/home/activity/game.png",
    "assets/images/home/activity/sleep.png",
    "assets/images/home/activity/personal_care.png",
    "assets/images/home/activity/care_check.png",
    "assets/images/home/activity/training.png",
    "assets/images/home/activity/pet_socialization.png",
    "assets/images/home/activity/feather_care.png",
    "assets/images/home/activity/nail_cutting.png",
    "assets/images/home/activity/bathe.png",
    "assets/images/home/activity/walk.png",
    "assets/images/home/activity/vet_visit.png",
    "assets/images/home/activity/vaccine.png",
    "assets/images/home/activity/pet_medicine.png",
    "assets/images/home/activity/parasitic_control.png",
  ];

  // Market Page
  static List<String> petList = [
    "assets/images/other/pets/dog.png",
    "assets/images/other/pets/cat.png",
    "assets/images/other/pets/bird.png",
    "assets/images/other/pets/fish.png",
    "assets/images/other/pets/hamster.png",
    "assets/images/other/pets/rabbit.png",
    "assets/images/other/pets/turtle.png",
  ];

  static const List<Map<String, dynamic>> socialLoginButtonList = [
    {
      'icon': Icons.phone,
      'color': Colors.green,
      'isActive': false,
    },
    {
      'icon': FontAwesome.google_brand,
      'color': Colors.red,
      'isActive': false,
    },
    {
      'icon': Icons.person_off,
      'color': Colors.blue,
      'isActive': true,
    },
  ];

  static const List<Map<String, dynamic>> formModelList = [
    {
      'leadingIcon': Icons.email,
      'hintText': 'emailExample',
      'isPasswordForm': false,
      'validator': 'validateEmail',
    },
    {
      'leadingIcon': Icons.lock,
      'hintText': 'passwordExample',
      'isPasswordForm': true,
      'validator': 'validatePassword',
    },
  ];
}
