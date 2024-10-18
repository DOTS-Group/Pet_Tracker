import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Localization Libs
import 'package:pet_tracker/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_tracker/pages/home/calendar_page.dart';
import 'package:pet_tracker/pages/home/map_page.dart';

// Pages
import 'package:pet_tracker/pages/home/pattern_page.dart';
import 'package:pet_tracker/pages/home/petadd_page.dart';
import 'package:pet_tracker/pages/home/profile_page.dart';
import 'package:pet_tracker/pages/intro/intro_page.dart';
import 'package:pet_tracker/pages/intro/login_page.dart';
import 'package:pet_tracker/pages/intro/splash_page.dart';

import 'pages/home/home_page.dart';
import 'pages/other/notification_page.dart';
import 'pages/other/settings_page.dart';
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
          home: const SplashPage(),
          routes: {
            // Intro Pages
            '/splash': (context) => const SplashPage(),
            '/intro': (context) => const IntroPage(),
            '/login': (context) => const LoginPage(),

            // Home Pages
            '/pattern': (context) => const PatternPage(),
            '/home': (context) => const HomePage(),
            '/map': (context) => const MapPage(),
            '/petadd': (context) => const PetaddPage(),
            '/calendar': (context) => const CalendarPage(),
            '/profile': (context) => const ProfilePage(),

            // Other Pages
            '/settings': (context) => const SettingsPage(),
            '/notifications': (context) => const NotificationPage(),
          },
          supportedLocales: L10n.all,
          locale: Locale(language),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        );
      },
    );
  }
}
