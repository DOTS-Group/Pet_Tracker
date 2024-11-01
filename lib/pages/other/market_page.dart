import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              child: Row(
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
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * SharedConstants.paddingGenerall,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
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
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  border: InputBorder.none,
                                  // Underline ekleme
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
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
                              child: Icon(Icons.search),
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
                      child: Icon(
                        Icons.more_vert_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
