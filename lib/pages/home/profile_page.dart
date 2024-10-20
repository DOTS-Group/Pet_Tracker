import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/appbar_widget.dart';

import '../../controllers/home/profilepage_controller.dart';
import '../../shared/provider_shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final String userName = "Kullanıcı Adı";
    final int userAge = 25;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * SharedConstants.paddingGenerall,
      ),
      child: Column(
        children: [
          // Appbar
          AppBarWidget(
            leadingIcon: Icons.qr_code_rounded,
            trailingIcon: Icons.drive_file_rename_outline_sharp,
            title: "Profil",
            leadingIconPressed: () {
              Navigator.pushNamed(context, '/qrcode');
            },
            trailingIconPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          // Avatar and User Information
          CircleAvatar(radius: height * 0.08),
          for (int i = 0; i < 2; i++)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: i == 1 ? 0 : height * SharedConstants.paddingGenerall,
              ),
              child: Text(
                i == 0 ? userName : "${context.tr('age')}: $userAge",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          const Expanded(child: ProfilePageContentWidget()),
        ],
      ),
    );
  }
}

class ProfilePageContentWidget extends StatelessWidget {
  const ProfilePageContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> titleKeyList = [
      "myPets",
      "calendvaccineTrackingar",
      "foodTracking",
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ProfilepageController profilepageController = ProfilepageController();
    return Consumer(
      builder: (context, ref, child) {
        final int profilePageIndex = ref.watch(profilePageIndexProvider);
        return Column(
          children: [
            // Tabbar
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall),
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            profilepageController.tabbarController(ref, i),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                context.tr(
                                  titleKeyList[i],
                                ),
                              ),
                              profilePageIndex == i
                                  ? Container(
                                      height: 2,
                                      width: width * 0.05,
                                      decoration: BoxDecoration(
                                        color: SharedConstants.orangeColor,
                                        borderRadius: BorderRadius.circular(1),
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 2,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Page
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: profilepageController.getContent(profilePageIndex),
              ),
            ),
          ],
        );
      },
    );
  }
}
