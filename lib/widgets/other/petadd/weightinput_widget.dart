import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants_shared.dart';
import '../../../shared/provider_shared.dart';

class WeightInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const WeightInputWidget({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> weightUnitTextList = ["kg", "g", "lbs"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("weight"),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: height * SharedConstants.paddingSmall,
          ),
          child: Container(
            width: double.infinity,
            // height: height * 0.08,
            decoration: BoxDecoration(
              color: SharedConstants.greyColor,
              borderRadius: BorderRadius.circular(
                height * SharedConstants.paddingGenerall,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingSmall,
                horizontal: width * SharedConstants.paddingMedium,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: context.tr("weight"),
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * SharedConstants.paddingGenerall,
                    ),
                    child: Consumer(
                      builder: (context, ref, child) {
                        String selectedIndex = ref.watch(petWeightUnitProvider);
                        return DropdownButton(
                          value: selectedIndex,
                          items: [
                            for (int i = 0; i < weightUnitTextList.length; i++)
                              DropdownMenuItem(
                                value: weightUnitTextList[i],
                                child: Text(
                                  weightUnitTextList[i],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                          ],
                          onChanged: (newValue) {
                            if (newValue != null) {
                              ref
                                  .read(petWeightUnitProvider.notifier)
                                  .update((state) => newValue);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
