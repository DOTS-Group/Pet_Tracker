import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants_shared.dart';
import '../../../shared/provider_shared.dart';

class FoodTypeSelectWidget extends StatelessWidget {
  const FoodTypeSelectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> foodTypes = [
      context.tr("dryFood"),
      context.tr("wetFood"),
      context.tr("rawFood"),
      context.tr("specialFood"),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: width * SharedConstants.paddingGenerall),
          child: Text(
            context.tr("foodType"),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: height * SharedConstants.paddingSmall,
          ),
          child: SizedBox(
            height: (Theme.of(context).textTheme.bodyMedium!.fontSize! * 1.5) +
                (height * SharedConstants.paddingSmall * 2),
            width: width,
            child: Consumer(
              builder: (context, ref, child) {
                int foodType = ref.watch(petFoodTypeIndexProvider);
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodTypes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: width * SharedConstants.paddingGenerall,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: foodType == index
                              ? SharedConstants.orangeColor
                              : SharedConstants.whiteColor,
                          borderRadius: BorderRadius.circular(
                            height * SharedConstants.paddingGenerall,
                          ),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.4,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height * SharedConstants.paddingSmall,
                            horizontal:
                                height * SharedConstants.paddingGenerall,
                          ),
                          child: Text(
                            context.tr(foodTypes[index]),
                            style: foodType == index
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: SharedConstants.whiteColor,
                                    )
                                : Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
