import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../models/scroolcard_model.dart';
import '../../../shared/constants_shared.dart';
import '../../../shared/list_shared.dart';
import '../../other/scroolcard_widget.dart';

class ActivitySelectedWidget extends StatelessWidget {
  final String selectedPet;

  const ActivitySelectedWidget({
    required this.selectedPet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> petList = [
      context.tr("foodActivity"),
      context.tr("waterDrink"),
      context.tr("toiletActivity"),
      context.tr("gameActivity"),
      context.tr("sleepActivity"),
      context.tr("personalCareActivity"),
      context.tr("careCheckActivity"),
      context.tr("trainingAP"),
      context.tr("petScoialization"),
      context.tr("featherCare"),
      context.tr("nailCare"),
      context.tr("bathe"),
      context.tr("walk"),
      context.tr("vetVisit"),
      context.tr("vaccine"),
      context.tr("petMedicine"),
      context.tr("parasiticControl"),
    ];
    List<ScroolCardModel> petCategoriesList = [
      for (int i = 0; i < petList.length; i++)
        ScroolCardModel(
          text: petList[i],
          imageRoute: SharedList.activityAddPageImageRouteList[i],
        ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: width * SharedConstants.paddingGenerall),
          child: Text(
            "$selectedPet ${context.tr(
              "whatisitdoing",
            )}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        // Search Bar
        Container(
          height: Theme.of(context).textTheme.bodyMedium!.fontSize! * 2 +
              (height * SharedConstants.paddingSmall * 2),
          width: width * 0.7,
          decoration: BoxDecoration(
            color: SharedConstants.whiteColor,
            borderRadius: BorderRadius.circular(
              height * SharedConstants.paddingGenerall,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
                vertical: height * SharedConstants.paddingSmall),
            child: TextField(
              decoration: InputDecoration(
                hintText: context.tr("fastSearch"),
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.5),
                    ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .color!
                      .withOpacity(0.5),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        ScroolCardWidget(
          scroollList: petCategoriesList,
        ),
      ],
    );
  }
}
