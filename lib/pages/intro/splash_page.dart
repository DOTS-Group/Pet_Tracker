import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

import '../../widgets/intro/loaderbar_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> _navigateAfterDelay(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      Navigator.pushNamed(context, "/intro");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Yönlendirmeyi başlat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateAfterDelay(context);
    });
    List<String> textList = [
      context.tr('splashPageTitle'),
      context.tr('splashPageSubtitle')
    ];
    List<String> titleText = textList[0].split(" ");
    String firstLetter = titleText[0][0];
    String remainingFirstWord = titleText[0].substring(1);
    String secondLetter = titleText.length > 1 ? titleText[1][0] : '';
    String remainingSecondWord =
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
                              style: GoogleFonts.dynaPuff(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .fontSize! *
                                          2,
                                      fontWeight: FontWeight.w900,
                                      color: SharedConstants.whiteColor,
                                    ),
                              ),
                            ),
                            // First word (remaining)
                            TextSpan(
                              text: "$remainingFirstWord ",
                              style: GoogleFonts.dynaPuff(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .fontSize! *
                                          1.5,
                                      fontWeight: FontWeight.bold,
                                      color: SharedConstants.whiteColor,
                                    ),
                              ),
                            ),

                            // Second letter

                            TextSpan(
                              text: secondLetter,
                              style: GoogleFonts.dynaPuff(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .fontSize! *
                                          2,
                                      fontWeight: FontWeight.w900,
                                      color: SharedConstants.whiteColor,
                                    ),
                              ),
                            ),
                            // Second word (remaining)
                            TextSpan(
                              text: remainingSecondWord,
                              style: GoogleFonts.dynaPuff(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .fontSize! *
                                          1.5,
                                      fontWeight: FontWeight.bold,
                                      color: SharedConstants.whiteColor,
                                    ),
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
                          style: GoogleFonts.sansitaSwashed(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: SharedConstants.whiteColor,
                                ),
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
                style: GoogleFonts.silkscreen(
                  textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white.withOpacity(0.5),
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
