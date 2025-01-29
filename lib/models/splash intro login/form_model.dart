import 'package:flutter/material.dart';

class LoginFormModel {
  final IconData? leadingIcon, trailingIcon;
  final String hintText;
  final bool isPasswordForm;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  LoginFormModel({
    required this.leadingIcon,
    required this.hintText,
    required this.isPasswordForm,
    required this.controller,
    this.trailingIcon,
    this.validator,
  });
}
