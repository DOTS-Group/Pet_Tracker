import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/list_shared.dart';
import '../../shared/provider_shared.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> petCateoiesList = [
      context.tr("dog"),
      context.tr("cat"),
      context.tr("bird"),
      context.tr("fish"),
      context.tr("hamster"),
      context.tr("rabbit"),
      context.tr("turtle"),
    ];
    List<String> categoriesTitleList = [
      context.tr("petCategories"),
      context.tr("all"),
    ];
    List<String> productsCategoriesList = [
      context.tr("allProducts"),
      context.tr("food"),
      context.tr("toys"),
      context.tr("training"),
      context.tr("toiletandCleaning"),
      context.tr("clothes"),
      context.tr("bed"),
      context.tr("cage"),
      context.tr("accessories"),
      context.tr("foodSupplement"),
      context.tr("health"),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingSmall,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: const MarketAppbarWidget(),
            ),
            // Banner
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Banners
                SizedBox(
                  height: height * 0.2,
                  width: width,
                  child: PageView(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * SharedConstants.paddingGenerall,
                          ),
                          child: Container(
                            height: height * 0.2,
                            // width: width -
                            //     (width * SharedConstants.paddingGenerall * 2),
                            decoration: BoxDecoration(
                              color: SharedConstants.orangeColor,
                              borderRadius: BorderRadius.circular(
                                height * SharedConstants.paddingGenerall,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text("Banner $i"),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SmoothIndicator(
                  offset: 10,
                  size: Size(
                    width,
                    height * 0.08,
                  ),
                  count: 3,
                  effect: const WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: SharedConstants.orangeColor,
                    dotColor: SharedConstants.greyColor,
                  ),
                ),
              ],
            ),
            // Categories
            Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * SharedConstants.paddingGenerall,
                    vertical: height * SharedConstants.paddingSmall,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 2; i++)
                        GestureDetector(
                          onTap: () {
                            i == 0
                                ? null
                                : Navigator.pushNamed(
                                    context, "/categoiresDetail");
                          },
                          child: Text(
                            categoriesTitleList[i],
                            style: i == 0
                                ? Theme.of(context).textTheme.bodyMedium
                                : Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: SharedConstants.orangeColor,
                                    ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Pet Categories
                SizedBox(
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
                ),
                // Products Categories
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * SharedConstants.paddingSmall,
                  ),
                  child: SizedBox(
                    height:
                        (Theme.of(context).textTheme.bodyMedium!.fontSize!) +
                            (height * SharedConstants.paddingGenerall) +
                            4,
                    width: width,
                    child: Consumer(
                      builder: (context, ref, child) {
                        int selectedIndex = ref
                            .watch(marketSelectedProductCategoryIndexProvider);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productsCategoriesList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0
                                    ? width * SharedConstants.paddingGenerall
                                    : width * SharedConstants.paddingLarge,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                      .read(
                                          marketSelectedProductCategoryIndexProvider
                                              .notifier)
                                      .update((value) => index);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      productsCategoriesList[index],
                                      style: selectedIndex == index
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              )
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height *
                                              SharedConstants.paddingSmall /
                                              2),
                                      child: selectedIndex == index
                                          ? Container(
                                              width: width * 0.1,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                color:
                                                    SharedConstants.orangeColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  2,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(
                                              height: 4,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                // Products
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MarketAppbarWidget extends StatelessWidget {
  const MarketAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        // Search Form Container
        Container(
          decoration: BoxDecoration(
              color: SharedConstants.whiteColor,
              borderRadius: BorderRadius.circular(
                height * SharedConstants.paddingGenerall,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * SharedConstants.paddingSmall,
              horizontal: width * SharedConstants.paddingGenerall,
            ),
            child: Row(
              children: [
                // Back Button
                Padding(
                  padding: EdgeInsets.only(
                    left: width * SharedConstants.paddingGenerall,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
                // Search Form
                SizedBox(
                  width: width * 0.6,
                  height: height * 0.05,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: width * SharedConstants.paddingMedium,
                    ),
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        hintText: "Ürün ara",
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        border: InputBorder.none,
                        // Underline ekleme
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: SharedConstants.orangeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * SharedConstants.paddingGenerall,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * SharedConstants.paddingGenerall,
          ),
          child: Container(
            child: const Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
