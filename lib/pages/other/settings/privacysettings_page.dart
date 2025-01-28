import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  State<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  final Map<String, bool> _privacySettings = {
    'location': true,
    'analytics': true,
    'sharing': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr('privacySettings')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: _privacySettings.entries.map((entry) {
                  return SwitchListTile(
                    value: entry.value,
                    onChanged: (value) {
                      setState(() {
                        _privacySettings[entry.key] = value;
                      });
                    },
                    title: Text(context.tr('privacy_${entry.key}')),
                    subtitle: Text(
                      context.tr('privacy_${entry.key}_description'),
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    activeColor: SharedConstants.orangeColor,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
