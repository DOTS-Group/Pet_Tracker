import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pages/home/calendar_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/home/map_page.dart';
import '../../pages/home/profile_page.dart';
import '../../pages/other/activityadd_page.dart';
import '../../shared/provider_shared.dart';

class PatternpageController {
  void indexController(WidgetRef ref, int index) {
    ref.read(patternPageIndexProvider.notifier).update((state) => index);
  }

  Widget getPageController(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const MapPage();
      case 2:
        return const ActivityAddPage();
      case 3:
        return const CalendarPage();
      case 4:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
