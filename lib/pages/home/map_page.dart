import 'package:flutter/material.dart';

import '../../shared/constants_shared.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // Header (Search Bar and More Button)
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
            vertical: height * SharedConstants.paddingGenerall,
          ),
          child: Row(
            children: [
              // Search Bar
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      height * SharedConstants.paddingGenerall,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * SharedConstants.paddingGenerall,
                      vertical: height * SharedConstants.paddingGenerall,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * SharedConstants.paddingGenerall,
                          ),
                          child: Text(
                            "Ara",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // More Button
              Padding(
                padding: EdgeInsets.only(
                  left: width * SharedConstants.paddingGenerall,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      height * SharedConstants.paddingGenerall,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      height * SharedConstants.paddingGenerall,
                    ),
                    child: Icon(
                      Icons.more_vert_rounded,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24 +
              (height *
                  SharedConstants
                      .paddingGenerall), // ListView’in yüksekliğini belirle
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Yatay kaydırma
            itemCount: 8, // Toplam öğe sayısı
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: width *
                      SharedConstants.paddingGenerall, // Öğeler arasında boşluk
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      height * SharedConstants.paddingGenerall,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * SharedConstants.paddingSmall,
                      horizontal: width * SharedConstants.paddingGenerall,
                    ),
                    child: Text("Data $index"), // İçeriğe index ekledim
                  ),
                ),
              );
            },
          ),
        ),

        Padding(
          padding:
              EdgeInsets.only(top: height * SharedConstants.paddingGenerall),
          child: SizedBox(
            height: height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Yatay kaydırma
              itemCount: 8, // Toplam öğe sayısı
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: width *
                        SharedConstants
                            .paddingGenerall, // Öğeler arasında boşluk
                  ),
                  child: Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * SharedConstants.paddingSmall,
                        horizontal: width * SharedConstants.paddingGenerall,
                      ),
                      child: Row(
                        children: [
                          // Clinic Photo
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Placeholder(),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width * SharedConstants.paddingGenerall,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < 2; i++)
                                    Text(
                                      "data",
                                    ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.pets,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: width *
                                                SharedConstants.paddingSmall,
                                          ),
                                          child: Text(
                                            "Yogyakarta, Indonesia",
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ), // İçeriğe index ekledim
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
