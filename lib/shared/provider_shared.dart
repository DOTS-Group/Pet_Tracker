import 'package:riverpod/riverpod.dart';

final languageProvider = StateProvider<String>((ref) => "tr"); // Language Provider
final patternPageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider
final introPageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider
final profilePageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider

final isCounterStarted = StateProvider<bool>((ref) => false);