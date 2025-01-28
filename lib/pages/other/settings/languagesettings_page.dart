import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/controllers/language_controller.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = LanguageController();
    final currentLanguage = languageController.getLanguageCode(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr('languageSettings')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildLanguageCard(
              context,
              'English',
              'en',
              currentLanguage == 'en',
              () => languageController.changeLanguage(
                  'en', context, const LanguageSettingsPage()),
            ),
            const SizedBox(height: 12),
            _buildLanguageCard(
              context,
              'Türkçe',
              'tr',
              currentLanguage == 'tr',
              () => languageController.changeLanguage(
                  'tr', context, const LanguageSettingsPage()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageCard(
    BuildContext context,
    String language,
    String code,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? SharedConstants.orangeColor : Colors.grey[300]!,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(language),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: SharedConstants.orangeColor)
            : null,
      ),
    );
  }
}
