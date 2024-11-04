import 'package:flutter/material.dart';

class MiniCardModel {
  final String title, subtitle, unit,route;
  final int value;
  final IconData icon;
  const MiniCardModel({
    required this.title,
    required this.subtitle,
    required this.unit,
    required this.route,
    required this.value,
    required this.icon,
  });
}