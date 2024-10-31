import 'package:flutter/material.dart';

import '../shared/constants_shared.dart';

class ProgressBarWidget extends StatelessWidget {
  final double value;
  final Color? backgroundColor,progressColor;
  const ProgressBarWidget({
    required this.value,
    this.backgroundColor,
    this.progressColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height * 0.01,
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(
              height * SharedConstants.paddingGenerall,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: (width - (width * SharedConstants.paddingMedium)) * value,
            height: height * 0.01,
            decoration: BoxDecoration(
              color: progressColor ?? SharedConstants.greenColor,
              borderRadius: BorderRadius.circular(
                height * SharedConstants.paddingGenerall,
              ),
            ),
          ),
        )
      ],
    );
  }
}
