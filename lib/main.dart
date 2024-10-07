import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/pages/intro/intro_page.dart';
import 'package:pet_tracker/pages/intro/splash_page.dart';

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
      home: IntroPage(),
    routes: {
      // Intro Pages
      '/splash': (context) => SplashPage(),
      '/intro': (context) => IntroPage(),
    },
    );
  }
}
