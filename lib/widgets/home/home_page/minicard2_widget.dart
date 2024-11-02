import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/home/homepage_controller.dart';
import '../../../shared/constants_shared.dart';
import '../../generalbutton_widget.dart';
import '../../progessbar_widget.dart';

class HomePageMiniCardWidget2 extends StatelessWidget {
  final List<String> titleTexts;
  final List<String>? vaccineContent;
  final String buttonText;
  final dynamic progressValue;
  final bool isDatePicker;
  final String? route;
  final VoidCallback? onPressed;
  const HomePageMiniCardWidget2({
    required this.titleTexts,
    required this.vaccineContent,
    required this.progressValue,
    required this.buttonText,
    required this.isDatePicker,
    this.route,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HomepageController homepageController = HomepageController();

    return Expanded(
      child: Container(
        height: height * 0.225,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            height * SharedConstants.paddingGenerall,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * SharedConstants.paddingSmall,
            horizontal: width * SharedConstants.paddingGenerall,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 2; i++)
                    Text(
                      titleTexts[i],
                      style: i == 0
                          ? Theme.of(context).textTheme.bodyMedium
                          : Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
              // Content
              isDatePicker == true
                  ? Consumer(
                      builder: (context, ref, child) {
                        String timerValue = ref.watch(timerProvider);
                        return Text(
                          timerValue,
                          style: Theme.of(context).textTheme.displayLarge,
                        );
                      },
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.vaccines_rounded,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: width * SharedConstants.paddingGenerall,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < 2; i++)
                                  Text(
                                    vaccineContent![i],
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    softWrap: true,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              // Progress Bar
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 2; i++)
                        Text(
                          i == 0
                              ? isDatePicker == false
                                  ? "Yakaşan Tarih"
                                  : "$progressValue dk"
                              : isDatePicker == false
                                  ? "$progressValue"
                                  : "45 dk",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                  ProgressBarWidget(
                    value: homepageController.progressCalculator(progressValue),
                    widthValue: ((width -
                                (width * SharedConstants.paddingGenerall * 3)) /
                            2) -
                        width * SharedConstants.paddingGenerall * 2,
                  ),
                ],
              ),

              GeneralButtonWidget(
                text: buttonText,
                backgroundColor: Colors.amber,
                textColor: Colors.white,
                isSmall: true,
                route: route,
                voidCallback: onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}
