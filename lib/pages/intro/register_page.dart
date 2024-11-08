import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../models/splash intro login/form_model.dart';
import '../../shared/constants_shared.dart';
import '../../shared/list_shared.dart';
import '../../widgets/generalbutton_widget.dart';
import '../../widgets/intro/login/faqgdprbuttons_widget.dart';
import '../../widgets/intro/login/textform_widget.dart';
import '../../widgets/intro/register/appbar_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> hintTextList = [
      context.tr('registerFormText1'),
      context.tr('registerFormText2'),
      context.tr('registerFormText3'),
      context.tr('registerFormText4'),
      context.tr('registerFormText5'),
    ];
    List<LoginFormModel> modelList = [
      for (int i = 0; i < SharedList.registerPageTextFormIconList.length; i++)
        LoginFormModel(
          leadingIcon: SharedList.registerPageTextFormIconList[i],
          hintText: hintTextList[i],
          isPasswordForm: i == 3 && i == 4 ? true : false,
          controller: TextEditingController(),
        ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // AppBar
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                ),
                child: const RegisterAppBarWidget(),
              ),
              // Header Image
              Image.asset(
                'assets/images/logo.png',
                height: height * 0.2,
              ),
              // Email and Password
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                  horizontal: width * SharedConstants.paddingGenerall,
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < modelList.length; i++)
                      Padding(
                        padding: EdgeInsets.only(
                          top: i == 0
                              ? 0
                              : height * SharedConstants.paddingGenerall,
                        ),
                        child: TextFormWidget(
                          model: modelList[i],
                        ),
                      ),
                  ],
                ),
              ),
              // const Spacer(),
              // Register Button
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                ),
                child: GeneralButtonWidget(
                  text: context.tr('registerButton'),
                  textColor: Colors.white,
                  backgroundColor: SharedConstants.orangeColor,
                  route: "/pattern",
                ),
              ),
              // Privacy Policy
              Padding(
                padding: EdgeInsets.only(
                  top: height * SharedConstants.paddingGenerall,
                ),
                child: const LoginPageFaqGdprWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
