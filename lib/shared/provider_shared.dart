import 'package:riverpod/riverpod.dart';

final languageProvider = StateProvider<String>((ref) => "tr"); // Language Provider
final rememberMeProvider = StateProvider<bool>((ref) => false); // Remember Me Provider
final isPasswordVisibile = StateProvider<bool>((ref) => false); // Password Visibility Provider
final patternPageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider
final introPageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider
final profilePageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider
final activityProvider = StateProvider<String>((ref) => ""); // Activity Provider
final isCounterStarted = StateProvider<bool>((ref) => false); // Home Page Counter Provider
final marketSelectedPetCategoryIndexProvider= StateProvider<int>((ref) => 0); // Market Page Selected Category Provider
final marketSelectedProductCategoryIndexProvider= StateProvider<int>((ref) => 0); // Market Page Selected Category Provider
