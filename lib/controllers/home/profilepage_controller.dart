import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/provider_shared.dart';

class ProfilepageController {
  void tabbarController(WidgetRef ref, int index) {
    ref.read(profilePageIndexProvider.notifier).update((state) => index);
  }
  // int getTabbarIndex(WidgetRef ref){
  //   return ref.read(profilePageIndexProvider);
  // }

  Widget getContent(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const Text("Pet List");
      case 1:
        return const Text("Vaccine Tracking");
      case 2:
        return const Text("Food Tracking");
      default:
        return const Text("Pet List");
    }
  }
}
