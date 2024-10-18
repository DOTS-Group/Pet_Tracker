import 'package:flutter/material.dart';
import 'package:pet_tracker/models/settings/settingspage_model.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/settings/settingsListtile_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<List<dynamic>> settingsList = [
      [
        AppLocalizations.of(context)!.settingsPageTitle1,
        SettingspageModel(
          leadingIcon: Icons.person,
          title: AppLocalizations.of(context)!.settingsPageSubtitle1,
          leadingIconColor: SharedConstants.orangeColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/account_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.notifications,
          title: AppLocalizations.of(context)!.settingsPageSubtitle2,
          leadingIconColor: SharedConstants.blueColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/notifications");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.lock,
          title: AppLocalizations.of(context)!.settingsPageSubtitle3,
          leadingIconColor: SharedConstants.greenColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/security_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.language,
          title: AppLocalizations.of(context)!.settingsPageSubtitle4,
          leadingIconColor: SharedConstants.purpleColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/language_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.info,
          title: AppLocalizations.of(context)!.settingsPageSubtitle5,
          leadingIconColor: SharedConstants.redColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/about_settings");
          },
        ),
      ],
      [
        AppLocalizations.of(context)!.settingsPageTitle2,
        SettingspageModel(
          leadingIcon: Icons.person,
          title: AppLocalizations.of(context)!.settingsPageSubtitle6,
          leadingIconColor: SharedConstants.orangeColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/account_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.notifications,
          title: AppLocalizations.of(context)!.settingsPageSubtitle7,
          leadingIconColor: SharedConstants.blueColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/notifications");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.lock,
          title: AppLocalizations.of(context)!.settingsPageSubtitle8,
          leadingIconColor: SharedConstants.greenColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/security_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.language,
          title: AppLocalizations.of(context)!.settingsPageSubtitle9,
          leadingIconColor: SharedConstants.purpleColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/language_settings");
          },
        ),
      ],
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            AppBarWidget(
              leadingIcon: Icons.arrow_back,
              trailingIcon: Icons.notifications_none,
              title: AppLocalizations.of(context)!.settings,
              leadingIconPressed: () {
                Navigator.pop(context);
              },
              trailingIconPressed: () {
                Navigator.pushNamed(context, "/notifications");
              },
            ),
            for (int i = 0; i < settingsList.length; i++)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * SharedConstants.paddingGenerall,
                ),
                child: SettingsListtileWidget(
                  listileList: settingsList[i],
                ),
              )
          ],
        ),
      ),
    );
  }
}
