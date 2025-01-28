import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class AboutSettingsPage extends StatelessWidget {
  const AboutSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr('about')),
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
                children: [
                  ListTile(
                    leading: Icon(Icons.info_outline,
                        color: SharedConstants.orangeColor),
                    title: Text(context.tr('appVersion')),
                    subtitle: const Text('1.0.0'),
                  ),
                  ListTile(
                    leading: Icon(Icons.description_outlined,
                        color: SharedConstants.blueColor),
                    title: Text(context.tr('termsOfService')),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip_outlined,
                        color: SharedConstants.greenColor),
                    title: Text(context.tr('privacyPolicy')),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.star_outline,
                        color: SharedConstants.purpleColor),
                    title: Text(context.tr('rateApp')),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
