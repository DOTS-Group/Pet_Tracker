import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  final Map<String, bool> _notifications = {
    'activities': true,
    'reminders': true,
    'updates': false,
    'marketing': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr('notificationSettings')),
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
                children: _notifications.entries.map((entry) {
                  return SwitchListTile(
                    value: entry.value,
                    onChanged: (value) {
                      setState(() {
                        _notifications[entry.key] = value;
                      });
                    },
                    title: Text(context.tr('notification_${entry.key}')),
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
