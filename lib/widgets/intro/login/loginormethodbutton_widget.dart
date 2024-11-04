import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';

class LoginorMethodButtonWidget extends StatelessWidget {
  final Color backgroundColor, iconColor, textColor;
  final IconData icon;
  final String text;

  const LoginorMethodButtonWidget({
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingGenerall,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * SharedConstants.paddingSmall,
          horizontal: width * SharedConstants.paddingMedium,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * SharedConstants.paddingMedium,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: textColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
