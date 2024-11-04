import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';

class LoginPageWelcomeMessageWidget extends StatelessWidget {
  const LoginPageWelcomeMessageWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List<String> titleList = [
      context.tr('welcomeMessage1'),
      context.tr('welcomeMessage2')
    ];
    return Column(
      children: [
        for (int i = 0; i < 2; i++)
          Padding(
            padding: EdgeInsets.only(
              top: i == 0 ? 0 : height * SharedConstants.paddingSmall,
            ),
            child: Text(
              titleList[i],
              style: i == 0
                  ? Theme.of(context).textTheme.displayLarge
                  : Theme.of(context).textTheme.bodyLarge,
            ),
          )
      ],
    );
  }
}
