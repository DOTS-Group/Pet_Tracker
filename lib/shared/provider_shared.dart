import 'package:riverpod/riverpod.dart';
// App Settings Providers
final languageProvider = StateProvider<String>((ref) => "tr"); // Language Provider
final rememberMeProvider = StateProvider<bool>((ref) => false); // Remember Me Provider
final isPasswordVisibile = StateProvider<bool>((ref) => false); // Password Visibility Provider

// Page Index Providers
final patternPageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider
final introPageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider
final profilePageIndexProvider =
    StateProvider<int>((ref) => 0); // Page İndex Provider

// Home Page Providers
final selectedPetProvider = StateProvider<String>((ref) => ""); // Home Page Selected Pet Provider
final activityProvider = StateProvider<String>((ref) => ""); // Activity Provider
final isCounterStarted = StateProvider<bool>((ref) => false); // Home Page Counter Provider
final marketSelectedPetCategoryIndexProvider= StateProvider<int>((ref) => 0); // Market Page Selected Category Provider
final marketSelectedProductCategoryIndexProvider= StateProvider<int>((ref) => 0); // Market Page Selected Category Provider

// Pet Add Page Providers
final petSexSelectedProvider = StateProvider<int>((ref) => 0); // Pet sex Provider
final petWeightUnitProvider = StateProvider<String>((ref) => "kg"); // Pet weight unit Provider
final petFoodTypeIndexProvider = StateProvider<int>((ref) => 0); // Pet food type Provider

// Other
final scroolCardWidgetSelectedItem = StateProvider<int>((ref) => 0); // Pet Add Page Provider
final anonymousUserProvider = StateProvider<bool>((ref) => false); // Anonymous User Provider