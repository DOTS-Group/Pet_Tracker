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
        "Welcome to Pet Tracker",
        "Keep track of your pet's health and activities"
      ],
      ["Health and Activities", "Monitor your pet's health and activities"],
      ["Pet Profile", "Create a profile for your pet"],
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
                        height: height,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      for (int i = 0; i < 2; i++)
                        Text(
                          textList[index][i],
                          style: i == 0
                              ? Theme.of(context).textTheme.displayMedium
                              : Theme.of(context).textTheme.bodyMedium,
                        ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Smooth Page Indicator
            SmoothPageIndicator(
              controller: controller,
              count: SharedList.introPageImageList.length,
              effect: WormEffect(
                dotWidth: 12,
                dotHeight: 12,
                spacing: 16,
                activeDotColor: Colors.blue,
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
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              height: height * 0.08,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  height * SharedConstants.generalPadding,
                ),
              ),
              child: Center(
                child: Text(
                  "data",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
