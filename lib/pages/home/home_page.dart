import 'package:flutter/material.dart';

import '../../shared/constants_shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header (Welcome Text and Search Icon)
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
            vertical: height * SharedConstants.paddingGenerall,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                height * SharedConstants.paddingGenerall,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingGenerall,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Image
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            height * SharedConstants.paddingGenerall,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            height * SharedConstants.paddingGenerall,
                          ),
                          child: Placeholder(
                            fallbackHeight: height * 0.12,
                            fallbackWidth: height * 0.12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * SharedConstants.paddingGenerall,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 3; i++)
                              const Text(
                                "Hoşgeldin, Kullanıcı Adı",
                              ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "Konum",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.qr_code),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
          ),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                height * SharedConstants.paddingGenerall,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingGenerall,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dostlar",
                  ),
                  Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * SharedConstants.paddingGenerall,
                        vertical: height * SharedConstants.paddingGenerall,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Placeholder(
                                fallbackHeight: height * 0.08,
                                fallbackWidth: height * 0.08,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width * SharedConstants.paddingGenerall,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0; i < 2; i++)
                                      Text(
                                        i == 0 ? "Poyraz" : "Rottweiler",
                                      ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   // width: width * 0.8,
                              //   // height: height * 0.1,
                              //   child: GridView.builder(
                              //     gridDelegate:
                              //         const SliverGridDelegateWithFixedCrossAxisCount(
                              //       crossAxisCount: 2,
                              //     ),
                              //     itemCount: 2,
                              //     itemBuilder:
                              //         (BuildContext context, int index) {
                              //       return Container(
                              //         child: Text(
                              //           "data",
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
