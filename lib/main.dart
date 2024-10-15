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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SharedTheme.height = height;
    SharedTheme.width = width;
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // theme: SharedTheme.lightTheme,
      // darkTheme: SharedTheme.darkTheme,
      // themeMode: ThemeMode.system,
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
