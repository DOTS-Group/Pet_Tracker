import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../models/scroolcard_model.dart';
import '../../../shared/constants_shared.dart';
import '../../../shared/list_shared.dart';
import '../../other/petcategories_widget.dart';

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
      children: [
        Padding(
          padding:  EdgeInsets.only(left: width * SharedConstants.paddingGenerall),
          child: Text(
            "$selectedPet ${context.tr(
              "whatisitdoing",
            )}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ScroolCardWidget(
          scroollList: petCategoriesList,
        ),
      ],
    );
  }
}
