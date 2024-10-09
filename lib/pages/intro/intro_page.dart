import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/shared/list_shared.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = PageController(); // PageView controller

    List<List<String>> textList = [
      [
        "Kolay Takip",
        "Dostarınızı her zaman yanınızdaki asistan ile sağlıklı bir şekilde takip edin.",
      ],
      [
        "Aşılarımız Tam",
        "Aşılarınız tam zamanında bildirilir ve paylaşıma izin verdiğiniz veteriner tarafından randevu verilir.",
      ],
      [
        "Karnımız Hep Tok",
        "Hayvanlarınızı her zaman yanınızda bir asistan ile sağlıklı bir şekilde takip edin.",
      ],
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                            left: width * SharedConstants.generalPadding,
                            right: width * SharedConstants.generalPadding,
                            top: height * SharedConstants.generalPadding,
                          ),
                          child: Text(
                            textList[index][i],
                            style: i == 0
                                ? Theme.of(context).textTheme.displayMedium
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
                spacing: width * SharedConstants.generalPadding,
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
                vertical: height * SharedConstants.mediumPadding,
                horizontal: width * SharedConstants.generalPadding,
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
                      height * SharedConstants.generalPadding,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * SharedConstants.generalPadding,
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
