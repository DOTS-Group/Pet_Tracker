import 'package:easy_localization/easy_localization.dart';
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
        height: height * 0.275,
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
                    Expanded(
                      flex: i == 0 ? 2 : 1,
                      child: Text(
                        titleTexts[i],
                        style: i == 0
                            ? Theme.of(context).textTheme.bodyMedium
                            : Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: i == 0 ? TextAlign.start : TextAlign.end,
                      ),
                    ),
                ],
              ),
              // Content
              isDatePicker == true
                  ? SizedBox(
                      height: height * 0.08,
                      child: Center(
                        child: Consumer(
                          builder: (context, ref, child) {
                            String timerValue = ref.watch(timerProvider);
                            return Text(
                              timerValue,
                              style: Theme.of(context).textTheme.displayLarge,
                            );
                          },
                        ),
                      ),
                    )
                  : SizedBox(
                      height: height * 0.08,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.vaccines_rounded,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width * SharedConstants.paddingGenerall,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < 2; i++)
                                    Text(
                                      vaccineContent![i],
                                      style: i == 0
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                          : Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .fontSize! *
                                                    0.8,
                                              ),
                                      softWrap: true,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                    ? context.tr("upcomingDate")
                                    : "$progressValue ${context.tr("minuteUnit")}"
                                : isDatePicker == false
                                    ? "$progressValue"
                                    : "45 ${context.tr("minuteUnit")}",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .fontSize! *
                                          0.8,
                                    )),
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
