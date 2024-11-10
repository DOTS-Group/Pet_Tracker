import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';
import '../../textinputcontainer_widget.dart';

class MicroChipInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const MicroChipInputWidget({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("microchipNumber"),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: height * SharedConstants.paddingSmall,
          ),
          child: TextInputWidget(
              controller: controller, hintTextTranslate: "microchipNumber"),
        ),
      ],
    );
  }
}
