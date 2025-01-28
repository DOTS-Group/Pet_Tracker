import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class ThemeSettingsPage extends StatefulWidget {
  const ThemeSettingsPage({super.key});

  @override
  State<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  String _selectedTheme = 'system';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr('themeSettings')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildThemeCard(
              context,
              'system',
              Icons.brightness_auto,
              context.tr('systemTheme'),
            ),
            const SizedBox(height: 12),
            _buildThemeCard(
              context,
              'light',
              Icons.light_mode,
              context.tr('lightTheme'),
            ),
            const SizedBox(height: 12),
            _buildThemeCard(
              context,
              'dark',
              Icons.dark_mode,
              context.tr('darkTheme'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeCard(
    BuildContext context,
    String theme,
    IconData icon,
    String title,
  ) {
    final isSelected = _selectedTheme == theme;
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
        onTap: () => setState(() => _selectedTheme = theme),
        leading: Icon(icon, color: SharedConstants.orangeColor),
        title: Text(title),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: SharedConstants.orangeColor)
            : null,
      ),
    );
  }
}
