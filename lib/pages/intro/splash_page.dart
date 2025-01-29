import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

import '../../widgets/intro/loaderbar_widget.dart';
import '../../controllers/home/splashpage_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashPageController _controller = SplashPageController();

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await _controller.handleNavigation(context);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final List<String> textList = [
      context.tr('splashPageTitle'),
      context.tr('splashPageSubtitle')
    ];
    final List<String> titleText = textList[0].split(" ");
    final String firstLetter = titleText[0][0];
    final String remainingFirstWord = titleText[0].substring(1);
    final String secondLetter = titleText.length > 1 ? titleText[1][0] : '';
    final String remainingSecondWord =
        titleText.length > 1 ? titleText[1].substring(1) : '';

    return Scaffold(
      backgroundColor: SharedConstants.orangeColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              SharedConstants.splashPageBackground,
              height: height,
              fit: BoxFit.cover,
            ),
            // Title and Subtitle
            Positioned(
              top: height * SharedConstants.paddingLarge * 2,
              child: SizedBox(
                width: width,
                child: Center(
                  child: Column(
                    children: [
                      // Title
                      RichText(
                        text: TextSpan(
                          children: [
                            // First letter
                            TextSpan(
                              text: firstLetter,
                              style: TextStyle(
                                fontFamily: 'DynaPuff',
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .fontSize! *
                                    2,
                                fontWeight: FontWeight.w900,
                                color: SharedConstants.whiteColor,
                              ),
                            ),
                            // First word (remaining)
                            TextSpan(
                              text: "$remainingFirstWord ",
                              style: TextStyle(
                                fontFamily: 'DynaPuff',
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .fontSize! *
                                    1.5,
                                fontWeight: FontWeight.bold,
                                color: SharedConstants.whiteColor,
                              ),
                            ),
                            // Second letter
                            TextSpan(
                              text: secondLetter,
                              style: TextStyle(
                                fontFamily: 'DynaPuff',
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .fontSize! *
                                    2,
                                fontWeight: FontWeight.w900,
                                color: SharedConstants.whiteColor,
                              ),
                            ),
                            // Second word (remaining)
                            TextSpan(
                              text: remainingSecondWord,
                              style: TextStyle(
                                fontFamily: 'DynaPuff',
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .fontSize! *
                                    1.5,
                                fontWeight: FontWeight.bold,
                                color: SharedConstants.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Subtitle
                      Padding(
                        padding: EdgeInsets.only(
                          top: height * SharedConstants.paddingGenerall,
                          left: width * 0.2,
                          right: width * 0.2,
                        ),
                        child: Text(
                          "\" ${textList[1]} \"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'DynaPuff',
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontSize,
                            color: SharedConstants.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Loader Bar
            Positioned(
              bottom: height * SharedConstants.paddingLarge * 1.2,
              left: width * 0.1,
              child: const LoaderBarWidget(),
            ),
            // App Version
            Positioned(
              bottom: height * SharedConstants.paddingMedium,
              left: width * 0.34,
              child: Text(
                "- Version ${SharedConstants.appVersion} -",
                style: TextStyle(
                  fontFamily: 'DynaPuff',
                  fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
