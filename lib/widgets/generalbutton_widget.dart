import 'package:flutter/material.dart';

import '../shared/constants_shared.dart';

class GeneralButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor, textColor;
  final String? route;
  final VoidCallback? voidCallback;
  final bool? isSmall;
  const GeneralButtonWidget({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.route,
    this.voidCallback,
    this.isSmall,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double heighgt = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route!);
        } else if (voidCallback != null) {
          voidCallback!();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            heighgt * SharedConstants.paddingGenerall,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: isSmall == true
                ? heighgt * SharedConstants.paddingSmall
                : heighgt * SharedConstants.paddingGenerall,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: textColor,
                ),
          ),
        ),
      ),
    );
  }
}
