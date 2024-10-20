import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/controllers/language_controller.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/shared/list_shared.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/intro/intropage_controller.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    IntroPageController introPageController = IntroPageController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = PageController(); // PageView controller

    List<List<String>> textList = [
      [
        context.tr('introPageTitle1'),
        context.tr('introPageSubTitle1'),
      ],
      [
        context.tr('introPageTitle2'),
        context.tr('introPageSubTitle2'),
      ],
      [
        context.tr('introPageTitle3'),
        context.tr('introPageSubTitle3'),
      ],
    ];
    return Scaffold(
      key: const ValueKey("introPage"),
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
                      const Icon(
                        Icons.language,
                        color: SharedConstants.blackColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * SharedConstants.paddingGenerall,
                        ),
                        child: const LanguageWidget(),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // 2. sayfaya animasyonlu olarak geçsin
                      controller.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      context.tr('skip'),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingMedium,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () {
                      introPageController.buttonFunction(
                          context, controller, ref, controller.initialPage);
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
                          child: Consumer(
                            builder: (context, ref, child) {
                              return Text(
                                controller.initialPage == 2
                                    ? context.tr('startButton')
                                    : context.tr('nextButton'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    LanguageController languageController = LanguageController();
    final languageCode = languageController.getLanguageCode(context);
    return DropdownButton(
      value: languageCode,
      items: SharedList.langugeSettingList,
      onChanged: (value) {
        if (value != languageCode) {
          languageController.changeLanguage(value, context, const IntroPage());
        }
      },
      underline: const SizedBox(),
      iconEnabledColor: SharedConstants.orangeColor,
    );
  }
}
