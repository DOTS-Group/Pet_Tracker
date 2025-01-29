import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import 'package:pet_tracker/pages/home/calendar_page.dart';
import 'package:pet_tracker/pages/home/map_page.dart';

// Pages
import 'package:pet_tracker/pages/home/pattern_page.dart';
import 'package:pet_tracker/pages/home/petadd_page.dart';
import 'package:pet_tracker/pages/home/profile_page.dart';
import 'package:pet_tracker/pages/intro/intro_page.dart';
import 'package:pet_tracker/pages/intro/login_page.dart';
import 'package:pet_tracker/pages/intro/splash_page.dart';
import 'package:pet_tracker/pages/other/qrcode_page.dart';

import 'pages/home/home_page.dart';
import 'pages/home/notificationdetails_page.dart';
import 'pages/intro/register_page.dart';
import 'pages/intro/renewpassword_page.dart';
import 'pages/other/activityadd_page.dart';
import 'pages/other/categoriesdetail_page.dart';
import 'pages/other/foodadd_page.dart';

import 'pages/other/market_page.dart';
import 'pages/other/notification_page.dart';
import 'pages/other/petdetails_page.dart';
import 'pages/other/pettrackingpremium_page.dart';
import 'pages/other/reminder_page.dart';
import 'pages/other/settings_page.dart';
import 'pages/other/socializationassitants_page.dart';
import 'pages/other/traningasssistants_page.dart';
import 'pages/other/vaccinedetails_page.dart';
import 'pages/other/walkingassistants_page.dart';
import 'pages/other/wallet_page.dart';
import 'shared/theme_shared.dart';
import 'pages/other/settings/accountsettings_page.dart';
import 'pages/other/settings/notificationsettings_page.dart';
import 'pages/other/settings/securitysettings_page.dart';
import 'pages/other/settings/sharedsettings_page.dart';
import 'pages/other/settings/languagesettings_page.dart';
import 'pages/other/settings/themesettings_page.dart';
import 'pages/other/settings/privacysettings_page.dart';
import 'pages/other/settings/support_page.dart';
import 'pages/other/settings/aboutsettings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Ekran yönünü kilitle
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
        '/login': (context) => LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/renewpassword": (context) => const RenewPassword(),

        // Home Pages
        '/pattern': (context) => const PatternPage(),
        '/home': (context) => const HomePage(),
        '/map': (context) => const MapPage(),
        '/calendar': (context) => const CalendarPage(),
        '/profile': (context) => const ProfilePage(),
        "/activityadd": (context) => const ActivityAddPage(),

        // Other Pages
        '/petadd': (context) => const PetaddPage(),
        '/settings': (context) => const SettingsPage(),
        '/notifications': (context) => const NotificationPage(),
        '/notificationdetails': (context) => const NotificationDetailsPage(),
        '/qrcode': (context) => const QrCodePage(),
        '/reminder': (context) => const ReminderPage(),
        "/vaccinedetails": (context) => const VaccineDetailsPage(),
        "/market": (context) => const MarketPage(),

        "/foodTracking": (context) => const FoodTrackingPage(),
        "/petdetails": (context) => const PetDetailsPage(),
        "/wallet": (context) => const WalletPage(),
        "/walkingAssistants": (context) => const WalkingAssistantsPage(),
        "/traningAssistants": (context) => const TraningAssistantsPage(),
        "/socializationAssistants": (context) =>
            const SocializationAssistantsPage(),
        "/pettrackingPremium": (context) => const PetTrackingPremiumPage(),
        "/categoiresDetail": (context) => const CategoriesDetailPage(),
        '/accountsettings': (context) => const AccountSettingsPage(),
        '/notificationsettings': (context) => const NotificationSettingsPage(),
        '/securitysettings': (context) => const SecuritySettingsPage(),
        '/sharedsettings': (context) => const SharedSettingsPage(),
        '/languagesettings': (context) => const LanguageSettingsPage(),
        '/themesettings': (context) => const ThemeSettingsPage(),
        '/privacysettings': (context) => const PrivacySettingsPage(),
        '/support': (context) => const SupportPage(),
        '/aboutsettings': (context) => const AboutSettingsPage(),
      },
    );
  }
}
