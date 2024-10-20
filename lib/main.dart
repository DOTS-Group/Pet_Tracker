import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

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
import 'shared/theme_shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('tr'),
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SharedTheme.height = height;
    SharedTheme.width = width;
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
        '/qrcode': (context) => const NotificationPage(),
      },
    );
  }
}
