import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/main.dart';

import '../../../models/homepage/activity_model.dart';
import '../../../shared/constants_shared.dart';
import '../../../shared/provider_shared.dart';

class ActicityAddCardWidget extends StatelessWidget {
  const ActicityAddCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<ActivityModel> activityList = [
      ActivityModel(
        title: context.tr("walkingActivity"),
        description: "walk",
        imageRoute: "assets/icons/home/homepage/walking.png",
      ),
      ActivityModel(
        title: context.tr("foodEatActivity"),
        description: "food",
        imageRoute: "assets/icons/home/homepage/food.png",
      ),
      ActivityModel(
        title: context.tr("waterDrinkActivity"),
        description: "water",
        imageRoute: "assets/icons/home/homepage/water.png",
      ),
      ActivityModel(
        title: context.tr("bathActivity"),
        description: "waching",
        imageRoute: "assets/icons/home/homepage/bath.png",
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingGenerall,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * SharedConstants.paddingGenerall,
          vertical: height * SharedConstants.paddingSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              context.tr("activityTitle"),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingSmall,
              ),
              child: SizedBox(
                height: height * 0.08,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: width * SharedConstants.paddingGenerall,
                      ),
                      child: Consumer(
                        builder: (context, ref, child) {
                          return GestureDetector(
                            onTap: () {
                              ref.read(activityProvider.notifier).update(
                                  (value) => activityList[index].description);
                              debugPrint(activityList[index].description);
                              Navigator.pushNamed(context, "/activityadd");
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: SharedConstants.greyColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      height * SharedConstants.paddingSmall,
                                    ),
                                    child: index == activityList.length
                                        ? const Icon(
                                            Icons.add,
                                            color: SharedConstants.orangeColor,
                                          )
                                        : Image.asset(
                                            activityList[index].imageRoute,
                                            height: Theme.of(context)
                                                .iconTheme
                                                .size,
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: height *
                                          SharedConstants.paddingSmall),
                                  child: Text(
                                    index == 4
                                        ? context.tr("addActivity")
                                        : activityList[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .fontSize! *
                                              0.8,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: activityList.length + 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}