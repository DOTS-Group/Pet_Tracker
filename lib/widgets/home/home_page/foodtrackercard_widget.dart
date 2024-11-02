import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';
import '../../progessbar_widget.dart';

class FoodTracakingCardWidget extends StatelessWidget {
  const FoodTracakingCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                      top: height * SharedConstants.paddingSmall / 2,
                    ),
                    child: Text(
                      i == 0 ? "Mama Markası" : "İçerik bilgisi",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                // Progress Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * SharedConstants.paddingSmall,
                  ),
                  child: ProgressBarWidget(
                    value: 0.2,
                    widthValue:
                        width - (width * SharedConstants.paddingGenerall * 2),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 2; i++)
                      Text(
                        i == 0 ? "4.5 Kg" : "15 Kg",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
