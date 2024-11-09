import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants_shared.dart';
import '../../../shared/provider_shared.dart';

class SelectedSexWidget extends StatelessWidget {
  const SelectedSexWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> petSexList = [context.tr("male"), context.tr("female")];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: height * SharedConstants.paddingSmall,
          ),
          child: Text(
            "${context.tr("sex")} :",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Consumer(builder: (context, ref, child) {
          int selectedIndex = ref.watch(petSexSelectedProvider);
          return SizedBox(
            height: (Theme.of(context).textTheme.bodyMedium!.fontSize! * 1.5) +
                (height * SharedConstants.paddingSmall * 2),
            width: width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left:
                        index == 0 ? 0 : width * SharedConstants.paddingMedium,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(petSexSelectedProvider.notifier)
                          .update((value) => index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == index && index == 0
                            ? SharedConstants.blueColor
                            : selectedIndex == index && index == 1
                                ? SharedConstants.orangeColor
                                : SharedConstants.whiteColor,
                        borderRadius: BorderRadius.circular(
                          height * SharedConstants.paddingGenerall,
                        ),
                        border: Border.all(
                          color: SharedConstants.blackColor,
                          width: 0.4,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * SharedConstants.paddingSmall,
                          horizontal: width * SharedConstants.paddingMedium,
                        ),
                        child: Text(
                          petSexList[index],
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: selectedIndex == index
                                        ? SharedConstants.whiteColor
                                        : SharedConstants.blackColor,
                                  ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        })
      ],
    );
  }
}
