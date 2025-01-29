import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pet_tracker/shared/provider_shared.dart';

class IntroPageController {
  static const String _introShownKey = 'introShown';

  // Check if intro has been shown before
  Future<bool> isIntroShown() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_introShownKey) ?? false;
  }

  // Mark intro as shown
  Future<void> setIntroShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_introShownKey, true);
  }

  void changeIndex(WidgetRef ref, int index) {
    ref.read(introPageIndexProvider.notifier).update((state) => index);
  }

  Future<void> buttonFunction(
    BuildContext context,
    PageController controller,
    WidgetRef ref,
    int index,
  ) async {
    if (index < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      changeIndex(ref, controller.initialPage + 1);
    } else {
      await setIntroShown();
      Navigator.pushReplacementNamed(context, "/login");
      changeIndex(ref, 2);
    }
  }
}
