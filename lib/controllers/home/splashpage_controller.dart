import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/user_api.dart';

class SplashPageController {
  final UserApi _userApi = UserApi();

  // Shared Preferences Keys
  static const String _firstTimeKey = 'isFirstTime';
  static const String _loginStatusKey = 'isLogin';

  // Check if application is opened for the first time
  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  // Mark application as opened before
  Future<void> setFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, false);
  }

  // Check user's login status
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginStatusKey) ?? false;
  }

  // Update user's login status
  Future<void> setLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginStatusKey, status);
  }

  // Handle navigation logic for splash screen
  Future<void> handleNavigation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (!context.mounted) return;
    try {
      // Check first time launch
      if (await isFirstTime()) {
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, "/intro");
        return;
      }
      // Check login status
      if (!await isLoggedIn()) {
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, "/login");
        return;
      }
      // Validate existing token
      try {
        final token = await _userApi.getToken();
        final loginResult = await _userApi.loginAgain(token);
        if (!context.mounted) return;

        if (loginResult) {
          Navigator.pushReplacementNamed(context, "/pattern");
        } else {
          _showError(context, true);
          await setLoginStatus(false);
          Navigator.pushReplacementNamed(context, "/login");
        }
      } catch (e) {
        if (!context.mounted) return;
        _showError(context, false);
        await setLoginStatus(false);
        Navigator.pushReplacementNamed(context, "/login");
      }
    } catch (e) {
      if (!context.mounted) return;
      _showError(context, false);
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  // Display error message to user
  void _showError(BuildContext context, bool isTokenExpired) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(getErrorMessage(isTokenExpired))),
    );
  }

  // Get appropriate error message
  String getErrorMessage(bool isTokenExpired) {
    return isTokenExpired
        ? 'Session expired due to inactivity'
        : 'An error occurred. Please login again.';
  }
}
