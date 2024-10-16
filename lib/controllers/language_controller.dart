import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/provider_shared.dart';

class LanguageController {
  void changeLanguage(WidgetRef ref, String languageCode) {
    // Locale _temp;
    switch (languageCode) {
      case 'en':
        ref.read(languageProvider.notifier).update((state) => "en");
        break;
      case 'tr':
        ref.read(languageProvider.notifier).update((state) => "tr");

        break;
      default:
        ref.read(languageProvider.notifier).update((state) => "tr");
    }
  }
}
