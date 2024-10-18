import 'package:flutter/material.dart';

class SettingspageModel {
  final IconData? leadingIcon;
  final String title;
  final Color leadingIconColor;
  final VoidCallback trailingIconPressed;

  SettingspageModel({
    required this.leadingIcon,
    required this.title,
    required this.trailingIconPressed,
    required this.leadingIconColor,
  });
}
