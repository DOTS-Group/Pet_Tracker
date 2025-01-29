import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

import '../../controllers/home/homepage_controller.dart';
import '../../models/home/homepage/minicard_model.dart';
import '../../shared/provider_shared.dart';
import '../../widgets/home/home_page/acticityaddcard_widget.dart';
import '../../widgets/home/home_page/appbar_widget.dart';
import '../../widgets/home/home_page/foodtrackercard_widget.dart';
import '../../widgets/home/home_page/minicard2_widget.dart';
import '../../widgets/home/home_page/minicard_widget.dart';
import '../../widgets/home/home_page/nopet_widget.dart';
import '../../widgets/home/home_page/story_widget.dart';
import '../../widgets/authcheck_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPet = true;
    List<List<String>> miniCardTitleList = [
      [context.tr("vaccineTracking"), "3 ${context.tr("dayUnit")}"],
      [context.tr("walking"), "00.00"],
    ];
    List<List<String>> buttonText = [
      [context.tr("more")],
      [context.tr("start"), context.tr("stop")],
    ];
    List<MiniCardModel> miniCardList = [
      MiniCardModel(
        title: context.tr("kilogram"),
        subtitle: "5 ${context.tr("kilogramUnit")}",
        unit: context.tr("kilogramUnit"),
        route: "/petdetails",
        value: 10,
        icon: Icons.scale,
      ),
      MiniCardModel(
        title: context.tr("spendMoney"),
        subtitle: "100 ${context.tr("turkishLiraUnit")}",
        unit: context.tr("turkishLiraUnit"),
        route: "/wallet",
        value: 100,
        icon: Icons.savings_rounded,
      ),
    ];
    return AuthCheckWidget(
      child: Scaffold(
        body: isPet == false
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * SharedConstants.paddingGenerall,
                ),
                child: const NoPetWidget(),
              )
            : Column(
                children: [
                  // Header
                  const HomePageAppBarWidget(),
                  // Body
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Pet Traning Strories List
                          const HomePageStroriesWidget(),
                          // Activity Add
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  width * SharedConstants.paddingGenerall,
                              vertical: height * SharedConstants.paddingSmall,
                            ),
                            child: const ActicityAddCardWidget(),
                          ),
                          // Weight and money spent
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  width * SharedConstants.paddingGenerall,
                            ),
                            child: Row(
                              children: [
                                for (int i = 0; i < 3; i++)
                                  i == 1
                                      ? SizedBox(
                                          width: width *
                                              SharedConstants.paddingGenerall,
                                        )
                                      : Expanded(
                                          child: HomePageMiniCardWidget(
                                            model: i == 0
                                                ? miniCardList[0]
                                                : miniCardList[1],
                                          ),
                                        ),
                              ],
                            ),
                          ),
                          // Food Tracking
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: height * SharedConstants.paddingSmall,
                              horizontal:
                                  width * SharedConstants.paddingGenerall,
                            ),
                            child: const FoodTracakingCardWidget(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * SharedConstants.paddingGenerall,
                              right: width * SharedConstants.paddingGenerall,
                              bottom: height * SharedConstants.paddingGenerall,
                            ),
                            child: Row(
                              children: [
                                for (int j = 0; j < 3; j++)
                                  j == 1
                                      ? SizedBox(
                                          width: width *
                                              SharedConstants.paddingGenerall,
                                        )
                                      : Consumer(
                                          builder: (context, ref, child) {
                                            bool isStarted =
                                                ref.watch(isCounterStarted);
                                            return HomePageMiniCardWidget2(
                                              titleTexts: j == 0
                                                  ? miniCardTitleList[0]
                                                  : miniCardTitleList[1],
                                              vaccineContent: const [
                                                "Gençlik Aşışı",
                                                "Gençlik dönemindeki önemli aşıdır.",
                                              ],
                                              progressValue:
                                                  j == 0 ? "05.11.2024" : 15,
                                              buttonText: j == 0
                                                  ? buttonText[0][0]
                                                  : isStarted
                                                      ? buttonText[1][1]
                                                      : buttonText[1][0],
                                              isDatePicker:
                                                  j == 0 ? false : true,
                                              route: j == 0
                                                  ? "/vaccinedetails"
                                                  : null,
                                              onPressed: j == 0
                                                  ? null
                                                  : () {
                                                      ref
                                                          .read(isCounterStarted
                                                              .notifier)
                                                          .update((value) =>
                                                              !value);
                                                      ref
                                                          .read(timerProvider
                                                              .notifier)
                                                          .toggleTimer(); // Start/Stop the timer
                                                    },
                                            );
                                          },
                                        ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
