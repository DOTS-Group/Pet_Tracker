import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pet_tracker/l10n/l10n.dart';
// Localization Libs
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:pet_tracker/l10n/l10n.dart';
import 'package:pet_tracker/pages/home/pattern_page.dart';
import 'package:pet_tracker/pages/intro/intro_page.dart';
import 'package:pet_tracker/pages/intro/login_page.dart';
import 'package:pet_tracker/pages/intro/splash_page.dart';

import 'pages/home/home_page.dart';

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        // Intro Pages
        '/splash': (context) => SplashPage(),
        '/intro': (context) => IntroPage(),
        '/login': (context) => LoginPage(),

        // Home Pages
        '/home': (context) => HomePage(),
        '/pattern': (context) => PatternPage(),
      },
      // supportedLocales: L10n.all,
      // locale: Locale("en"),
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
    );
  }
}
