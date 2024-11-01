import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';

import '../../widgets/other/petselected_widget.dart';
import '../../widgets/progessbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // Header
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
            vertical: height * SharedConstants.paddingSmall,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Pet Selected Dropdown
              PetSelectedDropdownButtonWidget(),
              Icon(
                Icons.notifications_none_outlined,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pet Traning Strories List
                SizedBox(
                  height: height * 0.2,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: width * SharedConstants.paddingGenerall,
                        ),
                        child: Column(
                          children: [
                            // Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                height * SharedConstants.paddingGenerall,
                              ),
                              child: Placeholder(
                                fallbackHeight: height * 0.15,
                                fallbackWidth: width * 0.3,
                              ),
                            ),
                            // Title
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * SharedConstants.paddingSmall,
                              ),
                              child: Text(
                                "Yürüyüş Asistanı",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Activity Add
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * SharedConstants.paddingGenerall,
                    vertical: height * SharedConstants.paddingSmall,
                  ),
                  child: Container(
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
                            "Aktiviteler",
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
                                      left: width *
                                          SharedConstants.paddingGenerall,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.amber,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              height *
                                                  SharedConstants.paddingSmall /
                                                  2,
                                            ),
                                            child: Icon(
                                              index == 4
                                                  ? Icons.add
                                                  : Icons.abc,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: height *
                                                  SharedConstants.paddingSmall),
                                          child: Text(
                                            index == 4 ? "Ekle" : "Yürüyüş",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: 5,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Weight and money spent
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * SharedConstants.paddingGenerall,
                  ),
                  child: Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        i == 1
                            ? SizedBox(
                                width: width * SharedConstants.paddingGenerall,
                              )
                            : Expanded(
                                child: Container(
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      height * SharedConstants.paddingGenerall,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          height * SharedConstants.paddingSmall,
                                      horizontal: width *
                                          SharedConstants.paddingGenerall,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Title and value
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            for (int i = 0; i < 2; i++)
                                              Text(
                                                "Ağırlık",
                                                style: i == 0
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                              ),
                                          ],
                                        ),
                                        // Value
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "5",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge,
                                              ),
                                              TextSpan(
                                                text: " kg",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                    ],
                  ),
                ),
                // Feed Tracking
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * SharedConstants.paddingSmall,
                  ),
                  child: Container(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < 2; i++)
                                Text(
                                  i == 0 ? "Mama Stoğu" : "17.11.2024",
                                  style: i == 0
                                      ? Theme.of(context).textTheme.bodyMedium
                                      : Theme.of(context).textTheme.bodySmall,
                                ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < 2; i++)
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: height *
                                        SharedConstants.paddingSmall /
                                        2,
                                  ),
                                  child: Text(
                                    i == 0 ? "Mama Markası" : "İçerik bilgisi",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              // Progress Bar
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      height * SharedConstants.paddingSmall,
                                ),
                                child: const ProgressBarWidget(value: 0.2),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0; i < 2; i++)
                                    Text(
                                      i == 0 ? "4.5 Kg" : "15 Kg",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
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
                                width: width * SharedConstants.paddingGenerall,
                              )
                            : Expanded(
                                child: Container(
                                  height: height * 0.225,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      height * SharedConstants.paddingGenerall,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          height * SharedConstants.paddingSmall,
                                      horizontal: width *
                                          SharedConstants.paddingGenerall,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Header
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            for (int i = 0; i < 2; i++)
                                              Text(
                                                i == 0 ? "Aşı Takip" : "4 Gün",
                                                style: i == 0
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                              ),
                                          ],
                                        ),
                                        // Content
                                        j == 0
                                            ? Row(
                                                children: [
                                                  Placeholder(
                                                    fallbackHeight:
                                                        height * 0.06,
                                                    fallbackWidth:
                                                        height * 0.06,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: width *
                                                          SharedConstants
                                                              .paddingGenerall,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        for (int i = 0;
                                                            i < 2;
                                                            i++)
                                                          Text(
                                                            "Aşı Adı",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall,
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Text("00:00",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge),
                                        // Progress Bar
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                for (int i = 0; i < 2; i++)
                                                  Text(
                                                    "4 gün",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                  ),
                                              ],
                                            ),
                                            const ProgressBarWidget(
                                              value: 0.2,
                                            ),
                                          ],
                                        ),
                                        const GeneralButtonWidget(
                                          text: "Başla",
                                          backgroundColor: Colors.amber,
                                          textColor: Colors.white,
                                          isSmall: true,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
