import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';

class AuthRequiredWidget extends StatelessWidget {
  const AuthRequiredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingMedium,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.tr('loginRequiredMessage'),
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * SharedConstants.paddingGenerall,
                ),
                child: GeneralButtonWidget(
                  backgroundColor: SharedConstants.orangeColor,
                  textColor: SharedConstants.secondaryColorLight,
                  text: context.tr('loginButton'),
                  voidCallback: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
