import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/controllers/language_controller.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/shared/list_shared.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/provider_shared.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = PageController(); // PageView controller

    List<List<String>> textList = [
      [
        AppLocalizations.of(context)!.introPageTitle1,
        AppLocalizations.of(context)!.introPageSubTitle1
      ],
      [
        AppLocalizations.of(context)!.introPageTitle2,
        AppLocalizations.of(context)!.introPageSubTitle2
      ],
      [
        AppLocalizations.of(context)!.introPageTitle3,
        AppLocalizations.of(context)!.introPageSubTitle3
      ],
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingGenerall,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Language Change
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: SharedConstants.blackColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * SharedConstants.paddingGenerall,
                        ),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final language = ref.watch(languageProvider);
                            return DropdownButton(
                              value: language,
                              items: SharedList.langugeSettingList,
                              onChanged: (value) {
                                LanguageController().changeLanguage(ref, value);
                              },
                              underline: SizedBox(),
                              iconEnabledColor: SharedConstants.orangeColor,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!.skip,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: controller,
                itemCount: SharedList.introPageImageList.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      Image.asset(
                        SharedList.introPageImageList[index],
                        height: height * 0.4,
                        // width: 300,
                        fit: BoxFit.cover,
                      ),
                      for (int i = 0; i < 2; i++)
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * SharedConstants.paddingGenerall,
                            right: width * SharedConstants.paddingGenerall,
                            top: height * SharedConstants.paddingGenerall,
                          ),
                          child: Text(
                            textList[index][i],
                            style: i == 0
                                ? Theme.of(context).textTheme.displayLarge
                                : Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            // Smooth Page Indicator
            SmoothPageIndicator(
              controller: controller,
              count: SharedList.introPageImageList.length,
              effect: WormEffect(
                dotWidth: 12,
                dotHeight: 12,
                spacing: width * SharedConstants.paddingGenerall,
                activeDotColor: SharedConstants.orangeColor,
                dotColor: Colors.grey,
              ),
              onDotClicked: (index) {
                controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingMedium,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: GestureDetector(
                onTap: () {
                  // if (controller.initialPage == 2) {
                  //   Navigator.pushNamed(context, "/pattern");
                  // } else {
                  //   controller.nextPage(
                  //     duration: Duration(milliseconds: 500),
                  //     curve: Curves.easeInOut,
                  //   );
                  // }
                  Navigator.pushNamed(context, "/login");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: SharedConstants.orangeColor,
                    borderRadius: BorderRadius.circular(
                      height * SharedConstants.paddingGenerall,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * SharedConstants.paddingGenerall,
                      ),
                      child: Text(
                        controller.initialPage == 2 ? "Başla" : "Devam",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
