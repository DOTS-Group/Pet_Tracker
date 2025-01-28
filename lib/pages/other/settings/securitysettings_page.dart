import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class SecuritySettingsPage extends StatefulWidget {
  const SecuritySettingsPage({super.key});

  @override
  State<SecuritySettingsPage> createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends State<SecuritySettingsPage> {
  bool _biometricEnabled = false;
  bool _twoFactorEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr('securitySettings')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    value: _biometricEnabled,
                    onChanged: (value) {
                      setState(() => _biometricEnabled = value);
                    },
                    title: Text(context.tr('biometricAuth')),
                    subtitle: Text(
                      context.tr('biometricAuthDescription'),
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    activeColor: SharedConstants.orangeColor,
                  ),
                  SwitchListTile(
                    value: _twoFactorEnabled,
                    onChanged: (value) {
                      setState(() => _twoFactorEnabled = value);
                    },
                    title: Text(context.tr('twoFactorAuth')),
                    subtitle: Text(
                      context.tr('twoFactorAuthDescription'),
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    activeColor: SharedConstants.orangeColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              title: Text(
                context.tr('changePassword'),
                style: const TextStyle(color: Colors.red),
              ),
              leading: const Icon(Icons.lock, color: Colors.red),
              onTap: () {
                // Change password logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
