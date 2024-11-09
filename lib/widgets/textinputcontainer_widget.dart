import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../shared/constants_shared.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintTextTranslate;

  const TextInputWidget({
    required this.controller,
    required this.hintTextTranslate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      // height: height * 0.06,
      decoration: BoxDecoration(
        color: SharedConstants.greyColor,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingGenerall,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: height * SharedConstants.paddingSmall,
          bottom: height * SharedConstants.paddingSmall,
          left: width * SharedConstants.paddingMedium,
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: context.tr(hintTextTranslate),
            hintStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
