import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/models/settings/settingspage_model.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

import '../../widgets/appbar_widget.dart';
// import '../../widgets/settings/settingsListtile_widget.dart';
import '../../widgets/settings/settingslisttile_widget.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<List<dynamic>> settingsList = [
      [
        context.tr('settingsPageTitle1'),
        SettingspageModel(
          leadingIcon: Icons.person,
          title: context.tr('settingsPageSubtitle1'),
          leadingIconColor: SharedConstants.orangeColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/account_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.notifications,
          title: context.tr('settingsPageSubtitle2'),
          leadingIconColor: SharedConstants.blueColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/notifications");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.lock,
          title: context.tr('settingsPageSubtitle3'),
          leadingIconColor: SharedConstants.greenColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/security_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.language,
          title: context.tr('settingsPageSubtitle4'),
          leadingIconColor: SharedConstants.purpleColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/language_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.info,
          title: context.tr('settingsPageSubtitle5'),
          leadingIconColor: SharedConstants.redColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/about_settings");
          },
        ),
      ],
      [
        context.tr('settingsPageTitle2'),
        SettingspageModel(
          leadingIcon: Icons.person,
          title: context.tr('settingsPageSubtitle6'),
          leadingIconColor: SharedConstants.orangeColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/account_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.notifications,
          title: context.tr('settingsPageSubtitle7'),
          leadingIconColor: SharedConstants.blueColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/notifications");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.lock,
          title: context.tr('settingsPageSubtitle8'),
          leadingIconColor: SharedConstants.greenColor,
          trailingIconPressed: () {
            Navigator.pushNamed(context, "/security_settings");
          },
        ),
        SettingspageModel(
          leadingIcon: Icons.language,
          title: context.tr('settingsPageSubtitle9'),
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
              title: context.tr('settings'),
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
