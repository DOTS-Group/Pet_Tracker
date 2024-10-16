import 'package:riverpod/riverpod.dart';

final languageProvider = StateProvider<String>((ref) => "tr"); // Language Provider

final streamPageIndexProvider =
    StateProvider<int>((ref) => 0); // Stream Page Index