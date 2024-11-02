import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';

class HomePageMiniCardWidget extends StatelessWidget {
  const HomePageMiniCardWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          height *
              SharedConstants.paddingGenerall,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height *
              SharedConstants.paddingSmall,
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
                  MainAxisAlignment
                      .spaceBetween,
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
    );
  }
}

