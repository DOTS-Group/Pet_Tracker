import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Localization Libs
import 'package:pet_tracker/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Pages
import 'package:pet_tracker/pages/home/pattern_page.dart';
import 'package:pet_tracker/pages/home/petadd_page.dart';
import 'package:pet_tracker/pages/intro/intro_page.dart';
import 'package:pet_tracker/pages/intro/login_page.dart';
import 'package:pet_tracker/pages/intro/splash_page.dart';

import 'pages/home/home_page.dart';
import 'shared/provider_shared.dart';
import 'shared/theme_shared.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SharedTheme.height = height;
    SharedTheme.width = width;

    return Consumer(
      builder: (context, ref, child) {
        final language = ref.watch(languageProvider);
        return MaterialApp(
          title: "Pet Tracker",
          debugShowCheckedModeBanner: false,
          theme: SharedTheme.lightTheme,
          darkTheme: SharedTheme.lightTheme,
          themeMode: ThemeMode.system,
          home: SplashPage(),
          routes: {
            // Intro Pages
            '/splash': (context) => SplashPage(),
            '/intro': (context) => IntroPage(),
            '/login': (context) => LoginPage(),

            // Home Pages
            '/pattern': (context) => PatternPage(),
            '/home': (context) => HomePage(),
            '/petadd': (context) => PetaddPage(),
          },
          supportedLocales: L10n.all,
          locale: Locale(language),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        );
      },
    );
  }
}
