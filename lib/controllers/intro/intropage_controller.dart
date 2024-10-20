import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/shared/provider_shared.dart';

class IntroPageController {
  void changeIndex(WidgetRef ref, int index) {
    ref.read(introPageIndexProvider.notifier).update((state) => index);
  }

  void buttonFunction(
    BuildContext context,
    PageController controller,
    WidgetRef ref,
    int index,
  ) {
    if (index < 2) {
      controller.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      changeIndex(ref,controller.initialPage + 1);
    } else {
      Navigator.pushNamed(context, "/login");
      changeIndex(ref, 2);
    }
  }
}
