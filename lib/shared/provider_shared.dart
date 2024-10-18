import 'package:riverpod/riverpod.dart';

final languageProvider = StateProvider<String>((ref) => "tr"); // Language Provider
final patternPageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider