import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';
import '../../generaladdbutton_widget.dart';

class NoPetWidget extends StatelessWidget {

  const NoPetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image
        Image.asset(
          SharedConstants.petAddImage,
          height: height * 0.3,
        ),
        // Title
        for (int i = 0; i < 2; i++)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical:
                  i == 0 ? 0 : height * SharedConstants.paddingGenerall,
            ),
            child: Text(
              i == 0
                  ? "Herhangi bir evcil dost bulunamadı!"
                  : "Şimdi hemen kaydederek bu ekrandan onun sağlığını takip edebilirsin",
              style: i == 0
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        // Add Button
        const GeneralAddButton(
          route: "/petadd",
        ),
      ],
    );
  }
}