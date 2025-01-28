import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr('settings')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingsSection(
              context,
              context.tr('accountAndSecurity'),
              [
                _buildSettingsTile(
                  context,
                  Icons.person,
                  context.tr('accountSettings'),
                  SharedConstants.orangeColor,
                  () => Navigator.pushNamed(context, '/accountsettings'),
                ),
                _buildSettingsTile(
                  context,
                  Icons.notifications,
                  context.tr('notificationSettings'),
                  SharedConstants.blueColor,
                  () => Navigator.pushNamed(context, '/notificationsettings'),
                ),
                _buildSettingsTile(
                  context,
                  Icons.security,
                  context.tr('securitySettings'),
                  SharedConstants.greenColor,
                  () => Navigator.pushNamed(context, '/securitysettings'),
                ),
                _buildSettingsTile(
                  context,
                  Icons.share,
                  context.tr('sharedSettings'),
                  SharedConstants.purpleColor,
                  () => Navigator.pushNamed(context, '/sharedsettings'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              context,
              context.tr('appSettings'),
              [
                _buildSettingsTile(
                  context,
                  Icons.language,
                  context.tr('languageSettings'),
                  SharedConstants.orangeColor,
                  () => Navigator.pushNamed(context, '/languagesettings'),
                ),
                _buildSettingsTile(
                  context,
                  Icons.palette,
                  context.tr('themeSettings'),
                  SharedConstants.blueColor,
                  () => Navigator.pushNamed(context, '/themesettings'),
                ),
                _buildSettingsTile(
                  context,
                  Icons.privacy_tip,
                  context.tr('privacySettings'),
                  SharedConstants.greenColor,
                  () => Navigator.pushNamed(context, '/privacysettings'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              context,
              context.tr('support'),
              [
                _buildSettingsTile(
                  context,
                  Icons.help,
                  context.tr('supportCenter'),
                  SharedConstants.purpleColor,
                  () => Navigator.pushNamed(context, '/support'),
                ),
                _buildSettingsTile(
                  context,
                  Icons.info,
                  context.tr('about'),
                  SharedConstants.redColor,
                  () => Navigator.pushNamed(context, '/aboutsettings'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<Widget> tiles,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          child: Column(
            children: tiles,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
