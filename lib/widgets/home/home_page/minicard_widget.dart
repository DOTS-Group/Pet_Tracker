import 'package:flutter/material.dart';

import '../../../models/homepage/minicard_model.dart';
import '../../../shared/constants_shared.dart';

class HomePageMiniCardWidget extends StatelessWidget {
  final MiniCardModel model;
  const HomePageMiniCardWidget({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          model.route,
        );
      },
      child: Container(
        height: height * 0.15,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and value
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 2; i++)
                    Expanded(
                      flex: i == 0 ? 2 : 1,
                      child: Text(
                        i == 0 ? model.title : model.subtitle,
                        textAlign: i == 0 ? TextAlign.start : TextAlign.end,
                        style: i == 0
                            ? Theme.of(context).textTheme.bodyMedium
                            : Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color!
                                      .withOpacity(
                                        0.5,
                                      ),
                                ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
              // Icon
              Center(
                child: Icon(
                  model.icon,
                  size: height * 0.05,
                  color: SharedConstants.orangeColor,
                ),
              ),
              // Value
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: model.value.toString(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    TextSpan(
                      text: " ${model.unit}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
