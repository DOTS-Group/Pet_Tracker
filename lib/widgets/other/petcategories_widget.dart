import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/constants_shared.dart';
import '../../shared/list_shared.dart';
import '../../shared/provider_shared.dart';

class PetCategoriesWidget extends StatelessWidget {
  final List<String> petCateoiesList;

  const PetCategoriesWidget({
    super.key,
    required this.petCateoiesList,
  });



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.15,
      width: width,
      child: Consumer(
        builder: (context, ref, child) {
          int selectedIndex =
              ref.watch(marketSelectedPetCategoryIndexProvider);
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                SharedList.marketPageCategoryImageList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      width * SharedConstants.paddingGenerall,
                ),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(marketSelectedPetCategoryIndexProvider
                            .notifier)
                        .update((value) => index);
                  },
                  child: Container(
                    height: height * 0.15,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? SharedConstants.orangeColor
                          : SharedConstants.greyColor,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          SharedList
                              .marketPageCategoryImageList[index],
                          height: height * 0.08,
                          color: selectedIndex == index
                              ? SharedConstants.whiteColor
                              : SharedConstants.blackColor,
                        ),
                        Text(
                          petCateoiesList[index],
                          style: selectedIndex == index
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: SharedConstants
                                          .whiteColor)
                              : Theme.of(context)
                                  .textTheme
                                  .bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}