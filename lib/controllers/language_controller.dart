import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class LanguageController {
  void changeLanguage(String languageCode, BuildContext context, Widget lastPage) async {
    switch (languageCode) {
      case 'en':
        context.setLocale(const Locale('en'));
        break;
      case 'tr':
        context.setLocale(const Locale('tr'));

        break;
      default:
        context.setLocale(const Locale('tr'));
    }
    // Yükleniyor pop-up'ı göster
    showDialog(
      context: context,
      barrierDismissible: false, // Kullanıcı popup'ı kapatamasın
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(), // Yükleme animasyonu
        );
      },
    );

    // 1 saniye bekle
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) =>  lastPage),
      (route) => false, // Tüm önceki sayfaları temizle.
    );
  }

  String getLanguageCode(BuildContext context) {
    return context.locale.languageCode;
  }
}
